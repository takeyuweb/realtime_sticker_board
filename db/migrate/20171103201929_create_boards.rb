class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards, comment: 'シール投票用ボード' do |t|
      t.string :title, null: false, default: '', comment: '質問'

      t.timestamps
    end
  end
end
