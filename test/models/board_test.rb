# == Schema Information
#
# Table name: boards
#
#  id          :uuid             not null, primary key
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  items_count :integer          default(0), not null
#

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
