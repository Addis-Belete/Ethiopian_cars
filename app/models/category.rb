class Category < ApplicationRecord
  has_many :vehicles
  validates :name, :priority, presence: true
end
