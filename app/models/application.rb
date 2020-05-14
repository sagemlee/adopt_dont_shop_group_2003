class Application < ApplicationRecord
  validates_presence_of :name, :description
  has_many :pet_application
end
