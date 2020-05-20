class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content

  validates_inclusion_of :rating, in: 1..10,
    message: "you've entered an invalid rating, please choose a number between 1 & 10"

  def self.average_rating
    Review.average(:rating)
  end
end
