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

    def has_file?(file_name)
      FileTest.file? @path.join(file_name)
    end

    def within
      FileUtils.cd @path do
        yield
      end
    end

    def exist?
      @path.exist?
    end

    def ==(directory)
      @path.to_s == directory.to_s
    end

  end
end
