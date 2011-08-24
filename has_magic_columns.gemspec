# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'has_magic_columns/version'

Gem::Specification.new do |s|
  s.name = "has_magic_columns"
  s.version = HasMagicColumns::VERSION

  s.authors = ["Drew Ulmer","Nicholas Zielinski","Brandon Keene"]
  s.date = Date.today
  s.description = "Allow addition of custom 'magic' columns to ActiveRecord models."
  s.summary = "Custom fields for Rails 3"
  s.email = ["latortuga@gmail.com","zieski@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.homepage = %q{https://github.com/latortuga/has_magic_columns}
  s.require_paths = ["lib"]

  s.add_dependency("activesupport", ["~> 3.0"])
  s.add_dependency("activerecord", ["~> 3.0"])

  s.add_development_dependency "rails", ["~> 3.0"]
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", ["~> 2.0"]
end
