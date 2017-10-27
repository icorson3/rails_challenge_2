class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @review = Review.find(params[:book_id])
  end
end