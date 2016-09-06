class CartBook < ApplicationRecord

  def book
    Book.find_by(id: book_id)
  end
  
end
