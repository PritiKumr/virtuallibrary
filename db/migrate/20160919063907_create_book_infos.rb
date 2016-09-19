class CreateBookInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :book_infos do |t|
      t.string :isbn_no
      t.date :edition
      t.text :desc

      t.timestamps
    end
  end
end
