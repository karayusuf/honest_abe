require 'spec_helper'
require_file 'honest_abe/command'

module HonestAbe
  describe Command do

    describe "#initialize" do
      it "stores the command" do
        command = Command.new("echo 'Baz'")
        command.raw_command.should eql "echo 'Baz'"
      end

      it "removes leading whitespace" do
        command = Command.new("     echo 'Foo'")
        command.raw_command.should eql "echo 'Foo'"
      end

      it "removes trailing whitespace" do
        command = Command.new("ls       ")
        command.raw_command.should eql "ls"
      end

      it "raises an error if the command cannot be stripped" do
        expect { Command.new(:bar) }.to raise_error NoMethodError
      end
    end

  end
end
