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
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
