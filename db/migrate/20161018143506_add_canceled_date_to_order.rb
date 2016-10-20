class AddCanceledDateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :canceled_date, :date
  end
end
