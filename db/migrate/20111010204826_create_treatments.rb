class CreateTreatments < ActiveRecord::Migration
  def self.up
    create_table :treatments do |t|
      t.string :title
      t.text :content
      t.references :user_to
      t.references :user_from
      t.timestamps
    end
  end

  def self.down
    drop_table :treatments
  end
end
