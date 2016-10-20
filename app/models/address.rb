class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :pincode, :city

  def title
    "#{name} - #{city.capitalize}, #{pincode}" 
  end

  def self.add_shipping_addr(user, addr_info = {})
    address = user.addresses.create(
      addr_info
    )
    return address
  end
    # addr_info = { first_name: "Shilpi", last_name: "Kayal", full_address: "3A, Chellapa Street, Chennai", contact_no: "9840291103", house_no: "123", city: "Chennai", district: "Chennai", pincode: '232101'}

  def name
    if last_name.present?
      "#{first_name} #{last_name}"
    else
      first_name
    end
  end
end
