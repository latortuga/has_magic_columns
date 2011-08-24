require 'rake'
gem 'rdoc'
require 'rdoc/task'
require 'rake/testtask'

require 'bundler'
Bundler::GemHelper.install_tasks

#desc 'Default: run unit tests.'
task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation.'
RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md","lib/**/*.rb")
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'HasMagicColumns'
  rdoc.options << '--line-numbers' << '--inline-source'
end
