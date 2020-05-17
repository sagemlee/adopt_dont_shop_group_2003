class PetApplicationsController < ApplicationController

  def index
   @pet = Pet.find(params[:pet_id])
  end

  def update_approval
    pet = Pet.find(params[:pet_id])
    application = Application.find(params[:application_id])
    if !pet.applications.approved_application.nil?
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
end
