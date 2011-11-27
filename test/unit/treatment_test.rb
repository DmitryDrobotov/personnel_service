require 'test_helper'

class TreatmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Treatment.new.valid?
  end
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

