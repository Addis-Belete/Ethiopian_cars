class Category < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  validates :name, :priority, presence: true
end
