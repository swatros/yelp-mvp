class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, format: { with: /\A[0-5]\z/, message: 'only allows numbers 0-5' }
end
