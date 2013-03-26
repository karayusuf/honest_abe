require 'spec_helper'
require_file 'honest_abe/builder'

module HonestAbe
  describe Builder do

    describe ".build" do
      it "parses the script into commands" do
        build = Builder.build("echo 'Foo'")
        build.commands.should eql ["echo 'Foo'"]
      end

      it "considers each line a command" do
        build = Builder.build("echo 'Foo'
                               echo 'Bar'")

        build.commands.should eql [
          "echo 'Foo'",
          "echo 'Bar'"
        ]
      end

      it "ignores empty lines" do
        build = Builder.build("echo 'Hello'

                               echo 'World'")

        build.commands.should eql [
          "echo 'Hello'",
          "echo 'World'"
        ]
      end
    end

  end
end
