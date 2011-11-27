require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Event.new.valid?
  end
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

