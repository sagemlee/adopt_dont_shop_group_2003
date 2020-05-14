class ApplicationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def new
    pet_ids = favorite.contents.keys
    @favorite_pets = Pet.find(pet_ids)
  end

  def create
    new_application = Application.create(application_params)
    
    pet_ids = params[:pet_ids]

    if new_application.save
      pet_ids.each do |pet_id|
        PetApplication.create!(application_id: new_application.id, pet_id: pet_id)
        favorite.contents.reject! { |pet_id,count| pet_ids.include?(pet_id) }
      end 
      flash[:notice] = "Your application has been submitted"
      redirect_to "/favorites"
      # session[:favorite].delete(pet_id)
    else 
      flash[:notice] = "You must fill out all contents of the application form"
      redirect_to '/applications/new'
    end 
  end

  private

  def application_params
    params[:application].permit(:name, :address, :city, :state, :zip, :phone_number, :description, :approval_status)
  end
end
