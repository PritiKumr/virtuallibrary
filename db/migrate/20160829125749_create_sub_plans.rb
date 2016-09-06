class CreateSubPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_plans do |t|
      t.string :name
      t.float :fee
      t.string :security
      t.integer :no_book
      t.string :max_book
      t.float :max_price
      t.integer :plan_id
      t.timestamps
    end
  end
end
