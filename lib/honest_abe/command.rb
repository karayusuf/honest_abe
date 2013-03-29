module HonestAbe
  class Command
    attr_reader :raw_command
    attr_reader :outcome

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
      @outcome = :unknown
    end

    def to_s
      @raw_command
    end

    def execute
      @outcome = ::Kernel.system(@raw_command)
    end

    def success?
      @outcome == true
    end
  end
end
