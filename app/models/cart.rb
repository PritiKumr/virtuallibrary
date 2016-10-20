class Cart < ApplicationRecord
  has_many :cart_books, dependent: :destroy
  has_one :order
  belongs_to :user

  # Status 1 represents that cart has been successfully converted into order.
  # Status 0 represents that cart is still in pending process.


  def self.active
    find_by(status: 0)
  end

  def self.update_cart(values = {})
    book = Book.find(values[:book_id])
    user = User.find(values[:user_id])
    c = Cart.find_by(status: 0, user_id: user.id)
    if c.nil?
      cart = Cart.create(
          user_id: user.id,
          value: book.rent_price,
          status: 0
        )
      CartBook.create(
        cart_id: cart.id, book_id: book.id, price: book.rent_price
      )
      return cart
    else
      CartBook.create(
        cart_id: c.id, book_id: values[:book_id], price: book.rent_price
      )
      total_cart_value = Cart.total_value(c.id)
      c.update(value: total_cart_value)
      return c
    end
  end

  # Calculates total cart value.
  def self.total_value(cart_id)
    CartBook.where(cart_id: cart_id).sum(:price)
  end

end
