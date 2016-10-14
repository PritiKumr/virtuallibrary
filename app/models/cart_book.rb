class CartBook < ApplicationRecord
  belongs_to :cart
  def book
    Book.find_by(id: book_id)
  end

end
