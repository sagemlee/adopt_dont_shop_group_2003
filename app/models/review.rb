class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content

  def self.average_rating
    Review.average(:rating)
  end
end
