class AddRentPriceToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :rent_price, :float
  end
end
