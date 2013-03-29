require 'spec_helper'
require_file 'honest_abe/builder'

module HonestAbe
  describe Builder do

    describe "new" do
      it "parses the script into commands" do
        build = Builder.new("echo 'Foo'")
        build.commands.map(&:to_s).should eql ["echo 'Foo'"]
      end
    end

    describe "#run" do
      it "executes each command" do
        Kernel.should_receive(:system).
               with("echo 'Foo'")

        build = Builder.new("echo 'Foo'")
        build.start
      end
    end

    describe "#success?" do
      it "returns true when all of the commands exited 0" do
        build = Builder.new("echo 'Bar'
                             echo 'Baz'")

        build.start
        build.should be_success
      end

      it "returns false if any of the commands do not exit 0" do
        build = Builder.new("some-non-existant-command")
        build.start
        build.should_not be_success
      end
    end

  end
end
