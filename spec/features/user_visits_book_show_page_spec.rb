require 'rails_helper'

describe 'a user visits the book show page' do 
   before(:each) do 
    @book = create(:book)
    @user = create(:user)
    @book.reviews.create!(body: 'a review', rating: 1, book_id: @book.id, user_id: @user.id)
   end
  it 'sees the book title and a list of reviews with the user that created a review' do
    visit "/books/#{@book.id}"

    save_and_open_page

    expect(page).to have_content 'Game of Thrones'
    expect(page).to have_content '1'
    expect(page).to have_content 'a review'
    expect(page).to have_content "#{@user.name}"
  end
end