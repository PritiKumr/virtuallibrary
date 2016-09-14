class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_one :user_info
  has_one :cart
  has_one :user_plan
  has_one :sub_plan, through: :user_plan

  def is_active?
    user_info.status?
  end

  def self.delieverable?(pincode)
    allowed_pincode = YAML::load_file('config/data/pincode.yml')
    puts "Pincode : #{pincode}"
    allowed_pincode.include?(pincode.to_i)
  end

  def self.city(pincode)
    Geocode.search(pincode).first.city
  end

  def self.distance(pincode)
    pincode_data = YAML::load_file('config/data/geocordinates.yml')
    warehouse_pincode = pincode_data["warehouse"]["mgs"]
    distance = Geocoder::Calculations.distance_between(
      warehouse_pincode, pincode
    ) # in miles.
    if distance == 0.0
      return "very near"
    else
      distance = (distance).round
      return "#{(distance).round*1.61} km away"
    end
  end
end
