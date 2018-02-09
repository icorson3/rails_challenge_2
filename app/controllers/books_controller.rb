class BooksController < ApplicationController
  def show
    @book = Book.create(title: 'Gone with the Wind', body: 'I shall never eat again!')
  end
end
