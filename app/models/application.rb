class Application < ApplicationRecord
  validates_presence_of :name, :description
  has_many :pet_applications
  has_many :pets, through: :pet_applications
end
