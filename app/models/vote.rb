class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :user_id, uniqueness: { scope: :vehicle_id }
  scope :popular, lambda {
                    select('vehicle_id, count(vehicle_id) as count').group(:vehicle_id).order('count desc').limit(1)
                  }
end
