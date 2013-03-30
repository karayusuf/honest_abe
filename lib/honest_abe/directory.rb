require 'fileutils'
require 'pathname'

module HonestAbe
  class Directory

    def initialize(*args)
      @path = Pathname.new(args.join("/"))
    end

    def create!
      FileUtils.mkdir_p @path
    end

    def exist?
      @path.exist?
    end

    def ==(directory)
      @path.to_s == directory.to_s
    end

  end
end
