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

      it "has a default outcome of pending" do
        command = Command.new("echo 'Baz'")
        command.outcome.should eql :pending
      end
    end

    describe "#to_s" do
      it "returns the raw command" do
        command = Command.new("echo 'Foo'")
        command.to_s.should eql "echo 'Foo'"
      end
    end

    describe "#execute" do
      it "sends the command to the system" do
        Kernel.should_receive(:system).with("echo 'Baz'")

        command = Command.new("echo 'Baz'")
        command.execute
      end

      it "sets the outcome to success when the command returns true" do
        Kernel.should_receive(:system).with("the-command") { true }

        command = Command.new("the-command")
        command.execute
        command.outcome.should eql :success
      end

      it "sets the outcome to failure when the command returns false" do
        Kernel.should_receive(:system).with("the-command") { false }

        command = Command.new("the-command")
        command.execute
        command.outcome.should eql :failure
      end

      it "sets the outcome to failure when the command returns nil" do
        Kernel.should_receive(:system).with("the-command") { nil }

        command = Command.new("the-command")
        command.execute
        command.outcome.should eql :failure
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
