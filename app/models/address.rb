class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :pincode, :city

  def title
    "#{user.name} - #{city.capitalize}, #{
    pincode}"
  end

  

end
