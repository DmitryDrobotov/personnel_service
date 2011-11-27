class Event < ActiveRecord::Base
  has_many :activities
  has_many :users, :through => :activities
end
# == Schema Information
#
# Table name: events
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

