module Refinery
  module TipOfTheDays
    module Admin
      class TipOfTheDaysController < ::Refinery::AdminController

        crudify :'refinery/tip_of_the_days/tip_of_the_day'

        # override because acts_as_indexed dont work with utf8
        def index
          if params[:search].present?
            @tip_of_the_days = TipOfTheDay.where('LOWER(title) ILIKE ?', "%#{params[:search].downcase}%")
          else
            @tip_of_the_days = TipOfTheDay.all
          end
          @tip_of_the_days = @tip_of_the_days.order('created_at desc').paginate(:page => params[:page])
        end

        protected

          def tip_of_the_day_params
            params.require(:tip_of_the_day).permit(:title, :content)
          end

      end
    end
  end
end
