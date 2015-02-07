module Refinery
  module TipOfTheDays
    module Admin
      class TipOfTheDaysController < ::Refinery::AdminController

        crudify :'refinery/tip_of_the_days/tip_of_the_day'

        protected

          def tip_of_the_day_params
            params.require(:tip_of_the_day).permit(:title, :content)
          end

      end
    end
  end
end
