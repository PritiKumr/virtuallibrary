class Wallet < ApplicationRecord
  #  0 Means no need to pay.
  # -1 Pending balance.

  belongs_to :user

  def amount_to_be_paid(total_amt)
    if amount > 0
      wallet_bal = total_amt-amount
      active_orders = user.orders.active
      if active_orders.present?
        sum_of_order_value = active_orders.sum(:value)
        bal_left = amount-sum_of_order_value
        if bal_left == 0
          return total_amt
        elsif bal_left < 0
          return -1
        else
          return (total_amt - bal_left)
        end
      else
        if wallet_bal > 0
          return wallet_bal
        else
          return 0
        end
      end
    elsif amount == 0
      return total_amt
    else
      return -1
    end
  end

end
