require 'spec_helper'
require_file 'honest_abe/build'

module HonestAbe
  describe Build do
    describe "#initialize" do
      it "stores the directory" do
        build = Build.new("/some/path", 10)
        build.directory.should eql Pathname.new("/some/path/10")
      end

      it "does not create the directory" do
        build = Build.new("/some/path", 10)
        build.directory.should_not be_exist
      end

      it "stores the build number" do
        build = Build.new("/path", 42)
        build.number.should eql 42
      end
    end
  end
end
