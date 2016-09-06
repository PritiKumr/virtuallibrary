class Plan < ApplicationRecord
  has_many :sub_plans, dependent: :destroy
end
