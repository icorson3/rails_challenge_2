class Book < ApplicationRecord

  def index
    @books = Book.all
  end 

  def show
    @book = Book.find(params[:id])
  end


end
