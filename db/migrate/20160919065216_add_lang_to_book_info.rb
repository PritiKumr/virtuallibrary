class AddLangToBookInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :book_infos, :lang, :string
  end
end
