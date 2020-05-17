class PetApplicationsController < ApplicationController

  def index
   @pet = Pet.find(params[:pet_id])
  end

  # def update_approval
  #   pet = Pet.find(params[:pet_id])
  #   application = Application.find(params[:application_id])
  #   if !pet.applications.approved_application.nil?
  #     flash[:notice] = "No more applications can be approved for this pet at this time."
  #     redirect_back fallback_location: "/pets/"
  #   else
  #     pet.adoption_status = "pending"
  #     application.approval_status = "true"
  #     pet.save
  #     application.save
  #     redirect_to "/pets/#{pet.id}"
  #   end

  def update_approval
    pet = Pet.find(params[:pet_id])
    application = Application.find(params[:application_id])
    if pet.adoption_status == "pending"
      flash[:notice] = "No more applications can be approved for this pet at this time."
      redirect_back fallback_location: "/pets/"
    else
      pet.adoption_status = "pending"
      application.approval_status = "true"
      pet.save
      application.save
      redirect_to "/pets/#{pet.id}"
    end
  end

  def destroy_approval
    pet = Pet.find(params[:pet_id])
    application = Application.find(params[:application_id])
    pet.adoption_status = "adoptable"
    application.approval_status = "false"
    pet.save
    application.save
    redirect_to "/applications/#{application.id}"
  end
end 
