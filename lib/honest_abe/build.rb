require 'honest_abe/command'
require 'honest_abe/directory'

module HonestAbe
  class Build
    attr_reader :directory, :number

    def initialize(path, number)
      @directory = Directory.new(path, number)
      @number = number
    end

    def build
      @directory.create!
    end

  end
end
