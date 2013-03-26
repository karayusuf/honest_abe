module HonestAbe
  class Builder
    attr_reader :commands

    def initialize(script)
      @commands = parse(script)
    end

    def start
      commands.each do |command|
        ::Kernel.system command
      end
    end

    private

    def parse(script)
      commands = script.split("\n")
      commands = commands.map(&:strip)
      commands.delete_if(&:empty?)
    end

  end
end
