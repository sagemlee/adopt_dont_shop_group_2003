class PetApplicationsController < ApplicationController

  def index
   @pet = Pet.find(params[:pet_id])
  end

  def update_approval
    pet = Pet.find(params[:pet_id])
    application = Application.find(params[:application_id])
    pet.adoption_status = "pending"
    pet.save
    application.approval_status = "true"
    application.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy_approval
    pet = Pet.find(params[:pet_id])
    application = Application.find(params[:application_id])
    pet.adoption_status = "adoptable"
    pet.save
    application.approval_status = "false"
    application.save
    redirect_to "/applications/#{application.id}"
  end
end
