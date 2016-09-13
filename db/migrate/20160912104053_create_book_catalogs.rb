class CreateBookCatalogs < ActiveRecord::Migration[5.0]
  def change
    create_table :book_catalogs do |t|
      t.integer :book_id
      t.text :catalog

      t.timestamps
    end
  end
end
