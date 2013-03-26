module HonestAbe
  class Builder
    attr_reader :commands

    def initialize(commands)
      @commands = commands
    end

    def self.build(script)
      commands = script.split("\n")
      commands = commands.map(&:strip)
      commands = commands.delete_if(&:empty?)

      new(commands)
    end

  end
end
