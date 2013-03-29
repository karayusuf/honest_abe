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
      @outcome = :pending
    end

    def to_s
      @raw_command
    end

    def execute
      @outcome =
        if ::Kernel.system(@raw_command)
          :success
        else
          :failure
        end
    end

    def success?
      @outcome == :success
    end
  end
end
