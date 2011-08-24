require 'has_magic_columns'

module HasMagicColumns
  class Railtie < Rails::Railtie
    initializer "has_magic_columns" do

      # I think this is probably a ghetto way of doing this
      # based on some limited research into other plugins. Neverhtless
      # it's the only way I know for the moment.
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send(:include, HasMagicColumns)
      end
    end
  end
end
