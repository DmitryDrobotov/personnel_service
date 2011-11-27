class Treatment < ActiveRecord::Base
  belongs_to :user_to, :class_name => "User"
  belongs_to :user_from, :class_name => "User"

  validates :title, :presence => true
end
# == Schema Information
#
# Table name: treatments
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  content      :text
#  user_to_id   :integer(4)
#  user_from_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

