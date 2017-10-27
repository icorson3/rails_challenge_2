require 'rails_helper'

describe "When I visit a book show page" do

  before(:each) do
    @book = Book.create(title: "Book 1")
    @user = User.create(name: "User 1")
    @review = Review.create(book: @book, user: @user, rating: 5, body: "This was a great book!")

    visit book_path(@book)
  end

  it "I see the book title and a list of reviews for that book, including the body and the user that created that review." do
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@review.body)
  end

  it "I also see the rating that the user gave the book." do
    expect(page).to have_content(@review.rating)
  end

  it "I also see the average rating for that book." do
    expect(page).to have_content(@book.avg_rating)
  end

  it "I see a header that includes the highest rating for that book." do
    expect(page).to have_content("Highest Rating: 4")
  end
end
