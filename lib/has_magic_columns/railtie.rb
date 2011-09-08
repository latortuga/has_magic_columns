require 'has_magic_columns'

module HasMagicColumns
  class Railtie < Rails::Railtie
    initializer "has_magic_columns" do
      ActiveSupport.on_load :active_record do
        require 'has_magic_columns/active_record'
      end
    end
  end
end
