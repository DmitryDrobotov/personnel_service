class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => "employee"
  end
end
