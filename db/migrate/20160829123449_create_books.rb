class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :sku
      t.string :name
      t.text :price
      t.integer :author_id
      t.integer :publication_id
      t.text :book_specs
      t.timestamps
    end
  end
end
