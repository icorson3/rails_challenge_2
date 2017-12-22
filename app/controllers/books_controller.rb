class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @avg_rating = @book.reviews.average(:rating).to_i
  end

end
