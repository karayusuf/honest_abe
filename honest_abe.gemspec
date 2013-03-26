# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'honest_abe/version'

Gem::Specification.new do |gem|
  gem.name          = "honest_abe"
  gem.version       = HonestAbe::VERSION
  gem.authors       = ["Joe Karayusuf"]
  gem.email         = ["jkarayusuf@gmail.com"]
  gem.description   = %q{Lightweight continuous integration server}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/karayusuf/honest_abe.git"

  gem.files         = Dir["./**/*.rb"]
  gem.executables   = "honest_abe"
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rack"
  gem.add_dependency "thor"

  gem.add_development_dependency "capybara"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "rspec"
end
