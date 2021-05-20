class Vehicle < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_attached_file :avatar, storage: :cloudinary,
                             path: ':id/:style/:filename',
                             styles: { large: '900x500>', medium: '300x300#', thumb: '300x200>', square: '200x200#' },
                             default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
  validates :make, :model, :fuel_type, :name, :vehicle_conditions, presence: true
  validates_associated :votes
  validates :vehicle_conditions, length: { minimum: 10 }
  validates :user, :category, presence: true
  validates :avatar, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :avatar
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 2.megabytes

  def voted?(user)
    !!votes.find { |like| like.user_id == user.id }
  end
end
