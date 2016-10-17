class AddReturnedOnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :returned_on, :date
  end
end
