class CreateBoardStickers < ActiveRecord::Migration[5.1]
  def change
    create_table :board_stickers, id: :uuid, default: 'gen_random_uuid()', comment: '貼り付けられたシール' do |t|
      t.belongs_to :board_item, foreign_key: true, null: false, type: :uuid, comment: '貼り付け欄'
      t.belongs_to :user, foreign_key: true, null: false, type: :uuid, comment: '貼り付けた人'
      t.integer :x, null: false, default: 0, comment: '貼り付け位置'
      t.integer :y, null: false, default: 0, comment: '貼り付け位置'

      t.timestamps
      t.index [:board_item_id, :user_id], unique: true
    end
    add_column :users, :board_stickers_count, :integer, null: false, default: 0, comment: '貼り付けたシールの数'
    add_column :board_items, :stickers_count, :integer, null: false, default: 0, comment: '貼り付けたシールの数'
  end
end
