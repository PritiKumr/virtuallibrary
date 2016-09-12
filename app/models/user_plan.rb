class UserPlan < ApplicationRecord
  belongs_to :user
  belongs_to :sub_plan
end
