require 'honest_abe/command'

require 'fileutils'
require 'pathname'

module HonestAbe
  class Build
    attr_reader :directory, :number

    def initialize(directory, number)
      @directory = Pathname.new(directory).join(number.to_s)
      @number = number
    end

    def build
      FileUtils.mkdir_p @directory.to_s
    end

  end
end
