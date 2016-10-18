class ChangeTypeOfDatesInOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :returned_on,  :datetime
    change_column :orders, :canceled_date,  :datetime
    change_column :orders, :delievery_date,  :datetime
    change_column :orders, :return_date,  :datetime
  end
end
