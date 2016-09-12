class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :contact_no
      t.string :gender
      t.integer :plan_id
      t.boolean :status
      t.integer :user_id
      t.timestamps
    end
  end
end
