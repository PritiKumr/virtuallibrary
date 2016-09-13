class RemoveCatalogsFromBook < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :catalogs
  end
end
