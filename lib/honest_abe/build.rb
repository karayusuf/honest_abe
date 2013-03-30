require 'honest_abe/command'
require 'pathname'

module HonestAbe
  class Build
    attr_reader :directory, :number

    def initialize(directory, number)
      @directory = Pathname.new(directory).join(number.to_s)
      @number = number
    end

  end
end
