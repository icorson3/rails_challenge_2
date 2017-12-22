class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @avg_rating = @book.reviews.average(:rating).to_i
    @high_rating = @book.reviews.maximum(:rating).to_i
    @low_rating = @book.reviews.minimum(:rating).to_i
    @high_review = @book.reviews.find_by(rating: @high_rating)
  end

end
