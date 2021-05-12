class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
end
