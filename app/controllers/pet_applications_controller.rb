class PetApplicationsController < ApplicationController

  def index
   @pet = Pet.find(params[:pet_id])
  end

  def update_approval
    pet = Pet.find(params[:pet_id])
    pet.adoption_status = "pending"
    pet.save
    pet_application = PetApplication.find_by(pet_id: pet.id, application_id: params[:application_id])
    pet_application.approved = "true"
    pet_application.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy_approval
    pet = Pet.find(params[:pet_id])
    application = Application.find(params[:application_id])
    pet_application = PetApplication.find_by(pet_id: pet.id, application_id: application.id)
    pet.adoption_status = "adoptable"
    pet.save
    pet_application.approved = "false"
    pet_application.save
    redirect_to "/applications/#{application.id}"
  end
end
