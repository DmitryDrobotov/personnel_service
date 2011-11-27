require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Position.new.valid?
  end
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

