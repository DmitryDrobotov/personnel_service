class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
# == Schema Information
#
# Table name: activities
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  event_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

