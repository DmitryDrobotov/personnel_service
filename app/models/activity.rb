class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :title, :presence => true, :length => { :maximum => 255 }
end
