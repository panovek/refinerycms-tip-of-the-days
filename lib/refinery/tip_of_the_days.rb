require 'refinerycms-core'

module Refinery
  autoload :TipOfTheDaysGenerator, 'generators/refinery/tip_of_the_days_generator'

  module TipOfTheDays
    require 'refinery/tip_of_the_days/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
