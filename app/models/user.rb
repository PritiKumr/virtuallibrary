class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_one :user_info
  has_many :carts
  has_one :user_plan
  has_one :sub_plan, through: :user_plan
  has_many :addresses
  has_many :bookmarks
  has_many :return_requests

  def is_active?
    user_info.status?
  end

  def self.delieverable?(pincode)
    allowed_pincode = YAML::load_file('config/data/pincode.yml')
    puts allowed_pincode
    allowed_pincode.include?(pincode)
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

  def active_cart_value
    carts.active.value
  end

  def active_order_value
    orders.active.sum(:value)
  end

  def valid_book_price?
    max_price_reached? || membership_expired?
  end

  def max_price_reached?
    active_order_value >= sub_plan.max_price || active_cart_value >= sub_plan.max_price
  end

  def membership_expired?
    user_plan.expiry_date == Date.today
  end

  def membership_extended?(book)
    book.price > sub_plan.max_price
  end

  def name
    if user_info.present?
      if user_info.first_name.present? && user_info.last_name.present?
        "#{user_info.first_name} #{user_info.last_name}".capitalize
      elsif user_info.first_name.present?
        "#{user_info.first_name}".capitalize
      end
    else
      email.split('@')[0].capitalize
    end
  end

  def avatar
    user_info.avatar.url
  end

  def bookmark_selected?(book_id)
    bookmarks.pluck(:book_id).include?(book_id)
  end

end
