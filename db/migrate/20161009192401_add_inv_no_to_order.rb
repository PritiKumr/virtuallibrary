class AddInvNoToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :inv_no, :string
  end
end
