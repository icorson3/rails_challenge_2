class BooksController < ApplicationController

def show
  @book = Book.find(params[:id])
  @reviews = @book.reviews
  @average = @book.average
end

end
