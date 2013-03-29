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

    describe "#execute" do
      it "sends the command to the system" do
        Kernel.should_receive(:system).with("echo 'Baz'")

        command = Command.new("echo 'Baz'")
        command.execute
      end

      it "stores the outcome of the command" do
        Kernel.should_receive(:system).with("echo 'Bar'")
              .and_return("outcome")

        command = Command.new("echo 'Bar'")
        command.execute

        command.outcome.should eql "outcome"
      end
    end

    describe "#success?" do
      it "returns true when the command succeeded" do
        command = Command.new("echo foo > /dev/null")
        command.execute

        command.should be_success
      end

      it "returns false when the command does not succeed" do
        command = Command.new("this-command-does-not-exist")
        command.execute

        command.should_not be_success
      end
    end

  end
end
