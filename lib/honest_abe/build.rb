require 'honest_abe/command'

module HonestAbe
  class Build
    attr_reader :commands

    def initialize(script)
      @commands = Command.parse(script)
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
