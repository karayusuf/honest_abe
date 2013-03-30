require 'rspec'
require 'fileutils'

def require_file(file)
  require File.expand_path("../../lib/#{file}", __FILE__)
end

module SpecHelpers
  def test_build_directory
    File.expand_path("../support/test_build", __FILE__)
  end

  def remove_test_build_directory
    FileUtils.rm_rf test_build_directory
  end
end

RSpec.configure do |config|
  config.include SpecHelpers

  config.before(:each) do
    remove_test_build_directory
  end
end
