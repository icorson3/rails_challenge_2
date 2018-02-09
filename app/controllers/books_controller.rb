class BooksController < ApplicationController

  def show
    @user = User.find(params[user_id])
    @book = Book.find(params[:id])
  end

end