class AddDelieveryDateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delievery_date, :date
    add_column :orders, :return_date, :date
    change_column :orders, :status, :integer
  end
end
