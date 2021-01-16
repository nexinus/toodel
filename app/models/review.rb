class Review < ApplicationRecord
  belongs_to :toilet
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
