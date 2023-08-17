class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.owner = current_user
    @review.renter = User.find(params[:user_id])
    if @review.save
      redirect_to owner_bookings_path
    else
      render "owner/bookings/index", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
