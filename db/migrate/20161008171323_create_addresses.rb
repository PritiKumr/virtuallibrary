class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :pincode
      t.string :sstring
      t.string :address1
      t.string :text
      t.string :address2
      t.string :text
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
