class BooksController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

end