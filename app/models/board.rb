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

class Board < ApplicationRecord
  has_many :items, class_name: 'Board::Item'
  accepts_nested_attributes_for :items
  validates :title, presence: true
  validate ->(board) do
    unless board.items.any?(&:valid?)
      board.errors.add :title, :item_missing
    end
  end
end
