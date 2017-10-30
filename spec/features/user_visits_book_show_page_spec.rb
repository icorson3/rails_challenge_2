require 'rails_helper'

describe 'user visits show page for specific book' do
  before :each do
    @user = User.create!(name: "Todd")
    @book = Book.create!(title: "Narnia")
    @review = Review.create!(body: "This book is great", author: @user.name, rating: "4", user: @user, book: @book)

  end

  it 'and sees book title, list of book reviews, including body, user who created review and user rating' do
    visit book_path(@user)

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Narnia")
    expect(page).to have_content("This book is great")
    expect(page).to have_content("4")
  end
end
