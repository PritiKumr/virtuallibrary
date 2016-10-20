class Order < ApplicationRecord
  # -1 -> Expired order. (Book has been returned also).
  #  0 -> Pending not yet delivered.
  #  1 -> Delievered.
  #  2 -> Return date has come.
  #  3 -> Canceled order.
  belongs_to :cart
  belongs_to :user
  has_one :return_request

  after_create :update_cart_status

  scope :active, -> {where('status != ? && status != ?', -1, 3)}
  scope :pending, -> {where(status: 0)}
  scope :delievered, -> {where(status: 1)}
  scope :return_pending, -> {where(status: 2)}
  scope :completed, -> {where(status: -1)}
  scope :canceled, -> {where(status: 3)}

  def cart
    Cart.find_by(id: cart_id)
  end

  def update_cart_status
    cart.update(status: 1)
  end

  def self.inv_no
    if Order.count.zero?
      1
    else
      last_inv_no = Order.last.inv_no
      last_inv_no.to_i+1
    end
  end


end
