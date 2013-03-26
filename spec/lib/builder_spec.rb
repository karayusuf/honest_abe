require 'spec_helper'
require_file 'honest_abe/builder'

module HonestAbe
  describe Builder do

    describe "new" do
      it "parses the script into commands" do
        build = Builder.new("echo 'Foo'")
        build.commands.should eql ["echo 'Foo'"]
      end

      it "considers each line a command" do
        build = Builder.new("echo 'Foo'
                               echo 'Bar'")

        build.commands.should eql [
          "echo 'Foo'",
          "echo 'Bar'"
        ]
      end

      it "ignores empty lines" do
        build = Builder.new("echo 'Hello'

                               echo 'World'")

        build.commands.should eql [
          "echo 'Hello'",
          "echo 'World'"
        ]
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

  end
end
