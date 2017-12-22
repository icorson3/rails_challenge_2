class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @review.book_id = @book.id
  end

end
