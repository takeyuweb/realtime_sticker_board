class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :title, null: false, default: '', comment: '質問'

      t.timestamps
    end
  end
end
