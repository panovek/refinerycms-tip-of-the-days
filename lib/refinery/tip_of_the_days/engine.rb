module Refinery
  module TipOfTheDays
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::TipOfTheDays

      engine_name :refinery_tip_of_the_days

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "tip_of_the_days"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.tip_of_the_days_admin_tip_of_the_days_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::TipOfTheDays)
      end
    end
  end
end
