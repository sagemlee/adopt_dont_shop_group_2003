class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications

  validates_presence_of :name
  validates_presence_of :img_url
  validates_presence_of :age
  validates_presence_of :sex
  validates_presence_of :description

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

  def self.pets_with_approved_apps
   Pet.joins(:pet_applications)
      .where("pet_applications.approved = 'true'")
  end

  def self.pets_with_pending_status
    Pet.where(adoption_status: 'pending')
  end
end
