class Application < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zipcode, :phone_number, :description
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.approved_application
    Application.find_by(approval_status: "true")
  end 
end
