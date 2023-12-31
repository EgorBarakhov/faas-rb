class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :eth_account, null: false
      t.string :nonce

      t.timestamps
    end

    add_index :users, :eth_account, unique: true
  end
end
