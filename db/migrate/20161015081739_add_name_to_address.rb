class AddNameToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :first_name, :string
    add_column :addresses, :last_name, :string
    add_column :addresses, :personal_addr, :boolean
  end
end
