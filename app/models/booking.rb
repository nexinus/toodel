class Booking < ApplicationRecord
  belongs_to :toilet
  belongs_to :user
  validates :date, :time, presence: true
  validates :confirmed, inclusion: { in: [ true, false ] }
end
