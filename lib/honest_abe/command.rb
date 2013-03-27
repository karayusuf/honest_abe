module HonestAbe
  class Command
    attr_reader :raw_command

    def initialize(command)
      @raw_command = command.strip
    end
  end
end
