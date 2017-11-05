# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
board = Board.new(title: 'ちょうど良いと思うスマートフォンの大きさは？')
%w(それ未満 4インチ 5インチ 5.5インチ それ以上).each_with_index do |item_title, i|
  board.items.build(title: item_title, position: i)
end
board.save!

[
  {title: 'あああああああああああああああああああああ'},
  {title: 'いいいいいいいいいいいいいいいいいいいいい'},
  {title: 'ううううううううううううううううううううう'},
].each do |board_attributes|
  b = Board.new(board_attributes)
  b.items.build([{title: 'はい', position: 0}, {title: 'いいえ', position: 1}])
  b.save!
end
