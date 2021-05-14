class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vehicles, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates_associated :vehicles
  validates_associated :votes
  validates :email, uniqueness: true

  def votes?(vehicle)
    vehicle.votes.where(user_id: id).any?
  end
end
