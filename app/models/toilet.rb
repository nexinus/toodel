class Toilet < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
