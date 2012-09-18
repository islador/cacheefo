require 'cacheefo'

module Cacheefo
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie
      initializer 'caceefo.insert_into_active_model' do
        ActiveSupport.on_load :action_controller do
          Cacheefo::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      if defined?(::ActiveRecord::Base)
        ::ActiveRecord::Base.send :include, Cacheefo
      end
    end
  end
end
