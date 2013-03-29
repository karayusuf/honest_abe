require 'honest_abe/command'

module HonestAbe
  class Builder
    attr_reader :commands

    def initialize(script)
      @commands = Command.parse(script)
      @successful_commands = []
    end

    def start
      commands.each do |command|
        command.execute
      end
    end

    def success?
      commands.all? { |command| command.success? }
    end

  end
end
