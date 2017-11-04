class CreateBoardItems < ActiveRecord::Migration[5.1]
  def change
    create_table :board_items, comment: 'シール貼り付け欄' do |t|
      t.references :board, foreign_key: true, null: false, comment: '質問'
      t.string :title, null: false, default: '', comment: '回答'
      t.integer :position, null: false, default: 0, comment: '表示順'

      t.timestamps
    end
    add_column :boards, :items_count, :integer, null: false, default: 0, comment: '貼り付け欄の数'
  end
end
