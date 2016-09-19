class ChangePriceTypeInBook < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :price, :float
  end
end
