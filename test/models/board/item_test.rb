# == Schema Information
#
# Table name: board_items
#
#  id             :uuid             not null, primary key
#  board_id       :uuid             not null
#  title          :string           default(""), not null
#  position       :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stickers_count :integer          default(0), not null
#

require 'test_helper'

class Board::ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
