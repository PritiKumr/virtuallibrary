class UserInfo < ApplicationRecord
  belongs_to :user

  geocoded_by :city   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  after_validation :geocode, if: ->(self){ self.address.present? and self.address_changed? }

  def user_status
    if status?
      'Active'
    else
      "InActive (You still haven't choosed any membershiip)."
    end
  end
end
