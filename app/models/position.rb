class Position < ActiveRecord::Base
  belongs_to :department

  belongs_to :manager, :class_name => "Position"
  has_many :managers, :class_name => "Position", :foreign_key => "manager_id"

  validates :name, :presence => true
end
# == Schema Information
#
# Table name: positions
#
#  id            :integer(4)      not null, primary key
#  department_id :integer(4)
#  name          :string(255)
#  manager_id    :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

