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

  def edit
    @review = Review.find(params[:review_id])

  end

  def update
    @review = Review.find(params[:review_id])
    shelter = Shelter.find(params[:shelter_id])
    @review.update(review_params)
    if @review.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash.now[:alert] = "Please fill out the title, rating and content to submit a review."
      render :edit
    end
  end

  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  private

  def review_params
    params
    .permit(:title, :rating, :content, :img_url)
    .reverse_merge(img_url: 'http://www.amandaspetcare.com/services/pet-sitting/dog-cat-grass.jpg')
  end
end
