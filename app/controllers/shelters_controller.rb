class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:shelter_id])
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_params)

    shelter.save
    redirect_to "/shelters/"
  end

  def edit
    @shelter = Shelter.find(params[:shelter_id])
  end

  def update
    shelter = Shelter.find(params[:shelter_id])
    shelter.update(shelter_params)

    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelter = Shelter.find(params[:shelter_id])
    pet_ids = shelter.pets.map { |pet| pet.id}
    Pet.destroy(pet_ids)
    shelter.destroy

    redirect_to "/shelters/"
  end

  private

  def shelter_params
    params[:shelter].permit(:name, :address, :city, :state, :zip)
  end
end
