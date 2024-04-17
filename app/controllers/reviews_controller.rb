class ReviewsController < ApplicationController
  def new
    @review = Review.new
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # raise
    @review = Review.new(review_params)
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review.restaurant_id = @restaurant.id
    @review.restaurant = @restaurant
    # raise
    if @review.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
