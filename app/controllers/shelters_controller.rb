class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:shelter_id])

    if (params[:order] == 'highest')
      @shelter_reviews = @shelter.reviews.highest_rating_desc_date
    elsif (params[:order] == 'lowest')
      @shelter_reviews = @shelter.reviews.lowest_rating_asc_date
    else 
      @shelter_reviews = @shelter.reviews
    end 
  end

  def new 
  end

  def create
    shelter = Shelter.new(shelter_params)
    shelter.save

    if shelter.save
      redirect_to "/shelters"
    else
      flash[:notice] = "Please fill out all fields to create a shelter"
      redirect_to "/shelters/new"
    end 
  end

  def edit
    @shelter = Shelter.find(params[:shelter_id])
  end

  def update
    shelter = Shelter.find(params[:shelter_id])
    shelter.update(shelter_params)
    
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:notice] = "Please fill out all fields to update the shelter"
      redirect_to "/shelters/#{shelter.id}/edit"
    end 
  end

  def destroy
    shelter = Shelter.destroy(params[:shelter_id])

    redirect_to "/shelters/"
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
