class CreateCartBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_books do |t|
      t.integer :book_id
      t.integer :cart_id
      t.float :price
      t.timestamps
    end
  end
end
