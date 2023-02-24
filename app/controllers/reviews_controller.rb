class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def count
    @count
  end

  def new
    @review = Review.new
  end

  def create
    @count = 0
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      @count += 1
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
    @count
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
