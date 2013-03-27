module HonestAbe
  class Builder
    attr_reader :commands

    def initialize(script)
      @commands = parse(script)
      @successful_commands = []
    end

    def start
      commands.each do |command|
        if ::Kernel.system command
          @successful_commands << command
        end
      end
    end

    def success?
      @successful_commands == @commands
    end

    private

    def parse(script)
      commands = script.split("\n")
      commands = commands.map(&:strip)
      commands.delete_if(&:empty?)
    end

  end
end
