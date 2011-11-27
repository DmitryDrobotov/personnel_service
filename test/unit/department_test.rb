require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Department.new.valid?
  end
end
# == Schema Information
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

