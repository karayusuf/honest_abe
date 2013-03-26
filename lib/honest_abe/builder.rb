module HonestAbe
  class Builder
    attr_reader :commands

    def initialize(script)
      @commands = parse(script)
    end

    def parse(script)
      commands = script.split("\n")
      commands = commands.map(&:strip)
      commands.delete_if(&:empty?)
    end

  end
end
