require 'spec_helper'

module Refinery
  module TipOfTheDays
    describe TipOfTheDay do
      describe "validations" do
        subject do
          FactoryGirl.create(:tip_of_the_day,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
