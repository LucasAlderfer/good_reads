class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    unless reviews.empty?
      reviews.order('rating desc').first.rating
    else
      0
    end
  end
end
