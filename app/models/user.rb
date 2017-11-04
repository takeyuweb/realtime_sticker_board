# == Schema Information
#
# Table name: users
#
#  id                   :uuid             not null, primary key
#  ip                   :inet             default(#<IPAddr: IPv4:127.0.0.1/255.255.255.255>), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  board_stickers_count :integer          default(0), not null
#

class User < ApplicationRecord
  has_many :board_stickers, class_name: 'Board::Sticker'
  validates :ip, presence: true
end
