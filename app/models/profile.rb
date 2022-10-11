class Profile < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_one_attached :avatar
end
