class ApplicationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def new
    pet_ids = favorite.contents.keys
    @favorite_pets = Pet.find(pet_ids)
  end

  def create
    # application = Application.new(params[:pet_ids])
    redirect_to "/favorites/"
  end

  private

  def application_params
    params[:application].permit(:name, :address, :city, :state, :zip, :phone_number, :description, :approved)
  end
  
  
end
