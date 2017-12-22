class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.book_id = params[:book_id]

    @review.save

    redirect_to book_path(@review.book)
  end

  private

  def review_params
    params.require(:review).permit()
  end
end
