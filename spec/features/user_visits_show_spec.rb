require 'rails_helper'

describe 'a user visits the show page' do 
  before(:each) do 
    @book = Book.create(title: 'GOT')
    @user = User.create(name: 'timo')
    @review = @book.reviews.create(body: 'a review', rating: 1, book_id: @book.id, user_id: @user.id)
    visit "/books/#{@book.id}"
  end
  it 'sees the book title and a list of reviews' do
    save_and_open_page
    expect(page).to have_content(@book.title)
    expect(page).to have_content('a review')
    expect(page).to have_content '1'
    expect(page).to have_content 'timo'
  end
end