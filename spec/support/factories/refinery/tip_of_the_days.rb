
FactoryGirl.define do
  factory :tip_of_the_day, :class => Refinery::TipOfTheDays::TipOfTheDay do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

