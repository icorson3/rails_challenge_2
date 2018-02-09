class BooksController < ApplicationController

  def show

  end

  private

  def book_params
    params.require(:book).permit(:title)
  end
end
