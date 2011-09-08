require 'rake'
gem 'rdoc'
require 'rdoc/task'
require 'rspec/core/rake_task'

require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Generate documentation.'
RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md","lib/**/*.rb")
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'HasMagicColumns'
  rdoc.options << '--line-numbers' << '--inline-source'
end

task :default => :spec

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb' #finders/active_record_spec.rb' if ENV['DB'] and ENV['DB'] != 'sqlite3'
end

namespace :spec do
  desc "Run Rails specs"
  RSpec::Core::RakeTask.new(:rails) do |t|
    t.pattern = %w'spec/finders/active_record_spec.rb spec/view_helpers/action_view_spec.rb'
  end
end
