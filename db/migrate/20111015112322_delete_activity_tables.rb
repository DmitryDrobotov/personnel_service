class DeleteActivityTables < ActiveRecord::Migration
  def up
    drop_table :activities
    drop_table :users_have_activities
  end

  def down
    create_table :activities do |t|
      t.string :title
      t.text :details
      t.timestamps
    end
    create_table :users_have_activities do |t|
      t.references :user
      t.references :activity
      t.timestamps
    end
  end
end
