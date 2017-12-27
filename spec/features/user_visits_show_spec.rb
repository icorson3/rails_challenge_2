require 'rails_helper'

describe 'a user visits the show page' do 
  before(:each) do 
    @book = Book.create(title: 'GOT')
    @user = User.create(name: 'timo')
    review = @book.reviews.create(body: 'a review', rating: 1, book_id: @book.id, user_id: @user.id)
    review_2 = @book.reviews.create(body: 'another', rating: 3, user_id: @user.id)
    review_3 = @book.reviews.create(body: 'anotherreview', rating: 5, user_id: @user.id)
    visit "/books/#{@book.id}"
  end
  it 'sees the book title and a list of reviews' do
    expect(page).to have_content(@book.title)
    expect(page).to have_content('a review')
    expect(page).to have_content '1'
    expect(page).to have_content 'timo'
  end

  it 'sees the maximum and minimum and average ratings' do 

    expect(page).to have_content("Highest Rating: 5")
    expect(page).to have_content("Lowest Rating: 1")
    expect(page).to have_content("Average Rating: 3.0")
  end

  it 'sees associated body and user name for max and min ratings' do

    expect(page).to have_content 'anotherreview timo'
    expect(page).to have_content 'a review timo'
  end
end