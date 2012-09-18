# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "cacheefo"
  s.version       = "0.0.1"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Ihor R"]
  s.email         = ["defsan@gmail.com"]
  s.date          = Date.today.to_s
  s.summary       = "Caching ActiveRecord formatters"
  s.description   = "Caching ActiveRecord formatters"
  s.files         = `git ls-files`.split("\n") - %w[cacheefo.gemspec Gemfile init.rb]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

end
