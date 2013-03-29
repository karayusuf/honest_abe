require 'spec_helper'
require_file 'honest_abe/command'

module HonestAbe
  describe Command do

    describe ".parse" do
      it "considers each line a command" do
        commands = Command.parse("echo 'Foo' \n echo 'Bar'")

        raw_commands = commands.map(&:raw_command)
        raw_commands.should eql ["echo 'Foo'", "echo 'Bar'"]
      end

      it "ignores empty lines" do
        commands = Command.parse("
          echo foo > /dev/null

          echo bar > /dev/null")

        raw_commands = commands.map(&:raw_command)
        raw_commands.should eql [
          "echo foo > /dev/null",
          "echo bar > /dev/null"
        ]
      end
    end

    describe "#initialize" do
      it "stores the command" do
        command = Command.new("echo 'Baz'")
        command.raw_command.should eql "echo 'Baz'"
      end
    end

  end
end
