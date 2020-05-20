class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content

  validates_inclusion_of :rating, in: 1..10,
    message: "You've entered an invalid rating, please choose a number between 1 & 10"

  def self.average_rating
    Review.average(:rating)
  end

  def self.highest_rating_desc_date
    Review.order(rating: :desc, created_at: :desc)
  end 

  def self.lowest_rating_asc_date
    Review.order(rating: :asc, created_at: :asc)
  end 
end
