require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Activity.new.valid?
  end
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

