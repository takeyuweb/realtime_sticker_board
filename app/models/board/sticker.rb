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

class Board::Sticker < ApplicationRecord
  belongs_to :item, class_name: 'Board::Item', foreign_key: :board_item_id, counter_cache: :stickers_count
  belongs_to :user, counter_cache: :board_stickers_count
  validates :x, presence: true, numericality: true
  validates :y, presence: true, numericality: true
  validates :y, presence: true, numericality: true
end
