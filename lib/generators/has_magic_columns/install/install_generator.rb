require 'rails/generators/base'

module HasMagicColumns
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates',__FILE__)

    desc "Add has_magic_columns migration."

    def self.next_migration_number(path)
      unless @prev_migration_nr
        @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      else
        @prev_migration_nr += 1
      end
      @prev_migration_nr.to_s
    end

    def add_migration
      migration_template "migration.rb", "db/migrate/add_has_magic_columns_tables.rb"
    end
  end
end
