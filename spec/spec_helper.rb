require 'rspec'

def require_file(file)
  require File.expand_path("../../lib/#{file}", __FILE__)
end
