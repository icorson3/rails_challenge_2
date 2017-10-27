class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @reviews = Review.find(params[:review_id])
    
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end

end
