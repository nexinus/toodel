class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [:name, :description, :address]
  pg_search_scope :search_by_name_description_address,
    against: [ :name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
