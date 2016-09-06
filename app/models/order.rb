class Order < ApplicationRecord
  after_create :update_cart_status

  belongs_to :user

  def cart
    Cart.find_by(id: cart_id)
  end

  def update_cart_status
    cart.update(status: 1)
  end

end
