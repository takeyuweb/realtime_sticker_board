class CreateBoardItems < ActiveRecord::Migration[5.1]
  def change
    create_table :board_items, id: :uuid, default: 'gen_random_uuid()', comment: 'シール貼り付け欄' do |t|
      t.belongs_to :board, foreign_key: true, null: false, type: :uuid, comment: '質問'
      t.string :title, null: false, default: '', comment: '回答'
      t.integer :position, null: false, default: 0, comment: '表示順'

      t.timestamps
    end
    add_column :boards, :items_count, :integer, null: false, default: 0, comment: '貼り付け欄の数'
  end
end
