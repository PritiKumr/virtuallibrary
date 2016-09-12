class UserInfo < ApplicationRecord
  belongs_to :user

  def user_status
    if status?
      'Active'
    else
      "InActive (You still haven't choosed any membershiip)."
    end
  end
end
