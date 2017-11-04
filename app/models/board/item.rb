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

class Board::Item < ApplicationRecord
  belongs_to :board, counter_cache: true
  has_many :stickers, class_name: 'Board::Sticker', foreign_key: :board_item_id
  validates :title, presence: true
end
