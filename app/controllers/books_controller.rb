class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @average_rating = @book.reviews.average(:rating)
    @max = @book.reviews.maximum(:rating)
    @min = @book.reviews.minimum(:rating)
  end
end