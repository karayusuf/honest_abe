require 'grit'

module HonestAbe
  module Repository
    class Git
      attr_reader :url, :branch

      def initialize(url, branch = :default)
        @url = url
        @branch = branch
      end

    end
  end
end
