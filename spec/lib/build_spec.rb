require 'spec_helper'
require_file 'honest_abe/build'

module HonestAbe
  describe Build do
    describe "#initialize" do
      it "stores the directory" do
        expected_directory = Pathname.new("#{test_build_directory}/10")

        build = Build.new(test_build_directory, 10)
        build.directory.should eql expected_directory
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
    end
  end
end
