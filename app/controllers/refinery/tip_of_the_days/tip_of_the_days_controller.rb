module Refinery
  module TipOfTheDays
    class TipOfTheDaysController < ::ApplicationController

      before_action :find_all_tip_of_the_days
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tip_of_the_day in the line below:
        present(@page)
      end

      def show
        @tip_of_the_day = TipOfTheDay.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tip_of_the_day in the line below:
        present(@page)
      end

    protected

      def find_all_tip_of_the_days
        @tip_of_the_days = TipOfTheDay.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/tip_of_the_days").first
      end

    end
  end
end
