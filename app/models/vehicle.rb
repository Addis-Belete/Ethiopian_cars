class Vehicle < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def voted?(user)
    !!self.votes.find { |like| like.user_id == user.id }
  end
end
