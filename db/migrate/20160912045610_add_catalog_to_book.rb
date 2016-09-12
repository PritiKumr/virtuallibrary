class AddCatalogToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :catalogs, :text
  end
end
