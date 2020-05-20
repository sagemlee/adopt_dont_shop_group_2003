class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates_presence_of :name, :address, :city, :state, :zip

  def self.three_highest_rated
    Shelter.joins(:reviews)
           .select('shelters.id, shelters.name, shelters.address, shelters.city, shelters.state, shelters.zip, avg(reviews.rating)')
           .group('shelters.id, shelters.name')
           .order('avg(reviews.rating) desc')
           .limit(3)
  end
end
