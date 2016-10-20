class AddPaidAmtToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :paid_amt, :float
  end
end
