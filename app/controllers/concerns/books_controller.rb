class BooksController < ApplicationController

def show
  @book = Book.find(params[:id])
  @reviews = @book.reviews
  @average = @book.average
  @highest_rating = @book.highest_rating
  @lowest_rating = @book.lowest_rating
  @high_review= @book.highest_rating_review
  @low_review= @book.lowest_rating_review
  # @high_user = User.find(@high_review.user_id)
  # @low_user = User.find(@low_review.user_id)

# end
end

end
