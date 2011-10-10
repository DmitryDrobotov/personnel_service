class Activity < ActiveRecord::Base
  belongs_to :user_to, :class_name => "User"
  belongs_to :user_from, :class_name => "User"

  validates :title, :presence => true, :length => { :maximum => 255 }
end
