module Refinery
  module TipOfTheDays
    class TipOfTheDay < Refinery::Core::BaseModel
      self.table_name = 'refinery_tip_of_the_days'

      acts_as_indexed :fields => [:title]
      validates :title, :presence => true
      validates :content, :presence => true

      def self.tip_of_the_day
        offset = (Date.today.year + Date.today.day) % TipOfTheDay.count rescue nil
        return TipOfTheDay.offset(offset).first rescue nil
      end

    end
  end
end
