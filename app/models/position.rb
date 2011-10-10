class Position < ActiveRecord::Base
  belongs_to :department
  
  belongs_to :manager, :class_name => "Position"
  has_many :managers, :class_name => "Position", :foreign_key => "manager_id"

  validates :name, :presence => true
end
