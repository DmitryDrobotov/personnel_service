class CreateUsersHaveActivities < ActiveRecord::Migration
  def up
  	create_table :users_have_activities do |t|
  		t.references :user
  		t.references :activity
  	end
  end

  def down
  	drop_table :users_have_activities
  end
end
