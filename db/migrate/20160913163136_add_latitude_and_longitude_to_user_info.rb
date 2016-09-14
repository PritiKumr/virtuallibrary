class AddLatitudeAndLongitudeToUserInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :latitude, :float
    add_column :user_infos, :longitude, :float
  end
end
