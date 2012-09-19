# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'cacheefo/version'

Gem::Specification.new do |s|
  gem.name          = "cacheefo"
  gem.version       = Cacheefo::VERSION

  gem.authors       = ["Ihor Ratsyborynskyy"]
  gem.email         = ["defsan@gmail.com"]
  gem.description   = %q{Lazy caching for ActiveRecord serialization (to_xml, as_json)}
  gem.summary       = %q{Lazy caching for ActiveRecord serialization (to_xml, as_json)}
  gem.homepage      = "https://github.com/defsan/cacheefo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

