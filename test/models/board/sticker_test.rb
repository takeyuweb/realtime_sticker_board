# == Schema Information
#
# Table name: board_stickers
#
#  id            :uuid             not null, primary key
#  board_item_id :uuid             not null
#  user_id       :uuid             not null
#  x             :integer          default(0), not null
#  y             :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class Board::StickerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
