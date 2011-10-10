class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.references :department
      t.string :name
      t.references :manager
      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
