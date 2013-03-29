module HonestAbe
  class Command
    attr_reader :raw_command

    def self.parse(commands)
      commands = commands.split("\n")
      commands = commands.map(&:strip)
      commands = commands.delete_if(&:empty?)

      commands.map do |command|
        new(command)
      end
    end

    def initialize(command)
      @raw_command = command
    end
  end
end
