class AddExpiryDateToUserPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :user_plans, :expiry_date, :date
  end
end
