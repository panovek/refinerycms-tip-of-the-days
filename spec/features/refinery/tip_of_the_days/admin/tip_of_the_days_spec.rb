# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "TipOfTheDays" do
    describe "Admin" do
      describe "tip_of_the_days" do
        refinery_login_with :refinery

        describe "tip_of_the_days list" do
          before do
            FactoryGirl.create(:tip_of_the_day, :title => "UniqueTitleOne")
            FactoryGirl.create(:tip_of_the_day, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.tip_of_the_days_admin_tip_of_the_days_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.tip_of_the_days_admin_tip_of_the_days_path

            click_link "Add New Tip Of The Day"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::TipOfTheDays::TipOfTheDay, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::TipOfTheDays::TipOfTheDay, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:tip_of_the_day, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.tip_of_the_days_admin_tip_of_the_days_path

              click_link "Add New Tip Of The Day"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::TipOfTheDays::TipOfTheDay, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:tip_of_the_day, :title => "A title") }

          it "should succeed" do
            visit refinery.tip_of_the_days_admin_tip_of_the_days_path

            within ".actions" do
              click_link "Edit this tip of the day"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:tip_of_the_day, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.tip_of_the_days_admin_tip_of_the_days_path

            click_link "Remove this tip of the day forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::TipOfTheDays::TipOfTheDay.count).to eq(0)
          end
        end

      end
    end
  end
end
