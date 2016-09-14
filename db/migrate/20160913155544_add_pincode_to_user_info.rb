class AddPincodeToUserInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :pincode, :string
    add_column :user_infos, :address1, :text
    add_column :user_infos, :address2, :text
    add_column :user_infos, :city, :string
    remove_column :user_infos, :address
  end
end
