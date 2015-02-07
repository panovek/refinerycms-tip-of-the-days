class CreateTipOfTheDaysTipOfTheDays < ActiveRecord::Migration

  def up
    create_table :refinery_tip_of_the_days do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tip-of-the-days"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tip_of_the_days/tip_of_the_days"})
    end

    drop_table :refinery_tip_of_the_days

  end

end
