class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORIES = %w(japanese french chinese italian belgian)

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  def average_rating
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    if self.reviews.length == 0
      "-"
    else
      sum.to_f / self.reviews.length
    end
  end
end
