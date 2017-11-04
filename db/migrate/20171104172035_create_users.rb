class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid, default: 'gen_random_uuid()', comment: '利用者' do |t|
      t.inet :ip, null: false, default: '127.0.0.1', comment: 'アクセス時IPアドレス'

      t.timestamps
    end
  end
end
