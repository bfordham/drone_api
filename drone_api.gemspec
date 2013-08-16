# -*- encoding: utf-8 -*-
require File.expand_path('../lib/drone_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bryan Fordham"]
  gem.email         = ["bfordham@gmail.com"]
  gem.description   = %q{Library to access the DroneApi API}
  gem.summary       = %q{Allows retrieving drone strike info, and basic searching.}
  gem.homepage      = "https://github.com/bfordham/drone_api"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "drone_api"
  gem.require_paths = ["lib"]
  gem.version       = DroneApi::VERSION

  gem.add_development_dependency 'rspec', '~> 2.13'
end
