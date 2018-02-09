class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    # @ratings = @book.
  end

end
