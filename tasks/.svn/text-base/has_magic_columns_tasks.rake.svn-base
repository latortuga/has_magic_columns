namespace :has_magic_columns do
  namespace :db do
    desc "Creates Magic tables for use with HasMagicColumns"
    task :create => :environment do
      raise "Task unavailable to this database (no migration support)" unless ActiveRecord::Base.connection.supports_migrations?
      require 'rails_generator'
      require 'rails_generator/scripts/generate'
      Rails::Generator::Scripts::Generate.new.run([ "has_magic_columns_tables", "add_has_magic_columns_tables" ])
    end
  end
end