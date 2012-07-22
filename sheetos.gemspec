# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sheetos/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcos Ganine"]
  gem.email         = ["marcosganine@gmail.com"]
  gem.summary       = %q{A simple spreadsheets parser}
  gem.description   = %q{Parses differents types of spreadsheets returning an array of arrays}
  gem.homepage      = "http://github.com/ganine/sheetos"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sheetos"
  gem.require_paths = ["lib"]
  gem.version       = Sheetos::VERSION

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard"

  gem.add_dependency "roo"
end
