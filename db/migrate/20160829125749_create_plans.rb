class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :fee
      t.float :security
      t.integer :no_book
      t.integer :max_book
      t.float :max_price

      t.timestamps
    end
  end
end
