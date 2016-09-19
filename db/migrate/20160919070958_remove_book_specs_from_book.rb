class RemoveBookSpecsFromBook < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :book_specs
    add_column :book_infos, :book_id, :integer
  end
end
