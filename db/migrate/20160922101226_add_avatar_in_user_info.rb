class AddAvatarInUserInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :avatar, :string
  end
end
