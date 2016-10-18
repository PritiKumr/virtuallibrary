class CreateWalletDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :wallet_details do |t|
      t.integer :wallet_id
      t.float :debit
      t.float :credit
      t.float :balance
      t.text :desc

      t.timestamps
    end
  end
end
