class BooksController < ApplicationController

  def show
    require 'pry'; binding.pry
    @book = Book.find(params[:id])
    @review = @book.reviews.find(params[:id])
  end
end