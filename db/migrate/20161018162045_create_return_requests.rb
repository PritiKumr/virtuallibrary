class CreateReturnRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :return_requests do |t|
      t.integer :user_id
      t.integer :order_id
      t.boolean :status

      t.timestamps
    end
  end
end
