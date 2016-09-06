class CreateBookStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :book_stocks do |t|
      t.integer :book_id
      t.boolean :available
      t.integer :no

      t.timestamps
    end
  end
end
