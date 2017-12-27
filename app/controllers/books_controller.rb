class BooksController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
    @avg = @book.average_rating
    @max = @book.maximum_rating
    @min = @book.minimum_rating
  end
end