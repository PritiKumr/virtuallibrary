class CartBook < ApplicationRecord
  belongs_to :cart
  after_destroy :delete_cart

  def book
    Book.find_by(id: book_id)
  end

  def delete_cart
    self.cart.destroy if self.cart.cart_books.empty?
  end

end
