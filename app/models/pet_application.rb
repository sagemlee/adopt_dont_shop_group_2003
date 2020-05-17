class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def self.approved_application
    PetApplication.find_by(approved: "true")
  end
end
