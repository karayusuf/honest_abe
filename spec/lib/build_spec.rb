require 'spec_helper'
require_file 'honest_abe/build'

module HonestAbe
  describe Build do
    describe "#initialize" do
      it "stores the directory" do
        expected_directory = Pathname.new("#{test_build_directory}/10")

        build = Build.new(test_build_directory, 10)
        build.directory.should == expected_directory
      end

      it "does not create the directory" do
        build = Build.new(test_build_directory, 10)
        build.directory.should_not be_exist
      end

      it "stores the build number" do
        build = Build.new(test_build_directory, 42)
        build.number.should eql 42
      end
    end

    describe "#build" do
      it "creates the build directory" do
        build = Build.new(test_build_directory, 42)
        build.build

        build.directory.should be_exist
      end

      it "executes the commands inside of the directory" do
        build = Build.new(test_build_directory, 1)
        build.build("touch test_file")

        build.directory.should have_file "test_file"
      end
    end

    describe "#success?" do
      it "returns true when all of the commands succeed" do
        build = Build.new(test_build_directory, 1)
        build.build("
          touch first_command
          touch second_command")

        build.should be_success
      end

      it "returns true when the build has not yet run" do
        build = Build.new(test_build_directory, 2)
        build.should be_success
      end

      it "returns false when one of the commands fails" do
        build = Build.new(test_build_directory, 2)
        build.build("
          touch first
          a-command-that-should-not-exist")

        build.should_not be_success
      end
    end
  end
end
