# == Schema Information
#
# Table name: board_items
#
#  id         :integer          not null, primary key
#  board_id   :integer          not null
#  title      :string           default(""), not null
#  position   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board::Item < ApplicationRecord
  belongs_to :board, counter_cache: true
  validates :title, presence: true
end
