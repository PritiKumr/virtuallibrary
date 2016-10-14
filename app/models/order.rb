class Order < ApplicationRecord
  # -1 -> Expired order. (Book has been returned also).
  #  0 -> Pending not yet delivered.
  #  1 -> Delievered.
  #  2 -> Return date has come.

  after_create :update_cart_status

  belongs_to :user

  scope :active, -> {where.not(status: -1)}

  def cart
    Cart.find_by(id: cart_id)
  end

  def update_cart_status
    cart.update(status: 1)
  end

  def self.inv_no
    "#{SecureRandom.hex(2)}-#{SecureRandom.hex(4)}-#{SecureRandom.hex(4)}"
  end

end
