class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :value
      t.string :status
      t.integer :cart_id
      t.timestamps
    end
  end
end
