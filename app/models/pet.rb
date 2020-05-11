class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name
  validates :sex, inclusion: { in: %w(male female),
    message: "%{value} is not a valid sex" }

  def self.adoptable_pets
    select { |pet| pet.adoption_status == "adoptable" }
  end

  def self.count_of_pets
    Pet.count
  end

  def self.count_of_adoptable_pets
    adoptable_pets.count
  end

  def self.all_pets_by_adoption_status
    Pet.order(:adoption_status)
  end
  
end