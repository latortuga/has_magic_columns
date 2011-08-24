module HasMagicColumns
  class Railtie < Rails::Railtie
    config.to_prepare do
      ActiveRecord::Base.send(:include, HasMagicColumns)
    end
  end
end
