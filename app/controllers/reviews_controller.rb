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
      flash[:alert] =  "#{review.errors.full_messages.first}, please fill out and resubmit"
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
      flash[:alert] = "#{review.errors.full_messages.first}, please fill out and resubmit"
      render :edit
    end
  end

  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  private

  def review_params
    if params[:img_url] == ""
      params.permit(:title, :rating, :content, :img_url).merge(img_url: 'https://adoptdontshop.s3-us-west-1.amazonaws.com/dog-cat-grass.jpg')
    else
      params.permit(:title, :rating, :content, :img_url)
    end
  end
end
