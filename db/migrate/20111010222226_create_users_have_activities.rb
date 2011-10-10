class CreateUsersHaveActivities < ActiveRecord::Migration
  def change
    create_table :users_have_activities do |t|
      t.references :user
      t.references :activity
      
      t.timestamps
    end
  end
end
