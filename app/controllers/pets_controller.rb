class PetsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def edit
    @pet_id = params[:pet_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)

    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
    else
      flash[:notice] = pet.errors.full_messages
      redirect_back fallback_location: "/shelters/#{shelter.id}/pets"
    end
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update(pet_params)

    if pet.save
      redirect_to "/pets/#{pet.id}"
    else
      flash[:notice] = pet.errors.full_messages
      redirect_back fallback_location: "/pets"
    end
  end

  def destroy
    Pet.destroy(params[:pet_id])
    favorite.contents.delete(params[:pet_id])

    redirect_to "/pets/"
  end

  private

  def pet_params
    params.permit(:name, :img_url, :age, :sex, :description, :adoption_status)
  end
end
