class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      flash[:notice] = "Your review was not created"
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :body)
  end
end
