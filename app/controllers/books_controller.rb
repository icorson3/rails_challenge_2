class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    byebug
  end
end
