require 'honest_abe/command'
require 'honest_abe/directory'

module HonestAbe
  class Build
    attr_reader :directory, :number

    def initialize(path, number)
      @directory = Directory.new(path, number)
      @number = number
    end

    def build(commands = "")
      @directory.create!
      @directory.within do
        commands = Command.parse(commands)
        commands.each(&:execute)
      end
    end

  end
end
