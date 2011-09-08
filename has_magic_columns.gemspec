# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'has_magic_columns/version'

Gem::Specification.new do |s|
  s.name = "has_magic_columns"
  s.version = HasMagicColumns::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Drew Ulmer","Nicholas Zielinski","Brandon Keene"]
  s.email = ["latortuga@gmail.com","zieski@gmail.com"]
  s.homepage = %q{https://github.com/latortuga/has_magic_columns}
  s.summary = "Custom fields for Rails 3"
  s.description = "Allow addition of custom 'magic' columns to ActiveRecord models."
  s.date = Date.today

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency("activesupport", ["~> 3.0"])
  s.add_dependency("activerecord", ["~> 3.0"])

  s.add_development_dependency "rails", ["~> 3.0"]
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", ["~> 2.0"]
  s.add_development_dependency "rdoc"
end
