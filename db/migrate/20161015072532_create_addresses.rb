class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string  :company_name
      t.string  :contact_no
      t.text    :full_address
      t.string :house_no
      t.string :city
      t.string :district
      t.string :pincode
      t.float  :longitude
      t.float  :latitude

      t.timestamps
    end
  end
end
