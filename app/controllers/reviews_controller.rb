class ReviewsController < ApplicationController
  def new
    @current_shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @current_shelter = Shelter.find(params[:shelter_id])
    review = @current_shelter.reviews.create(review_params)
    if review.save
      flash[:notice] = "Review saved"
      redirect_to "/shelters/#{@current_shelter.id}"
    else
      flash.now[:alert] = "Please fill out the title, rating and content to submit a review."
      render :new
    end
  end

  private

  def review_params
    params.permit(:title, :img_url, :rating, :content)
  end
end
