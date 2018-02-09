class BooksController < ApplicationController

  def show
    binding.pry
    @book = Book.find(params[:id])
    @average_ratings = Book.average_ratings
    @book_average_rating = @average_ratings.find(params[:id]).avg_rating
  end

end
