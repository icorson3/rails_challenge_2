class Books < ApplicationController

  def show
    @books = Book.find(params[:id])
  end

end
