require 'rails_helper'

describe "When a visitor visits a Book show page" do
  before(:each) do
    @book = Book.create(title: "Eaarth")
    @user1 = User.create(name: "Lee")
    @review1 = Review.create(body: "Good book", rating: 5, user: @user1)
    @review2 = Review.create(body: "Ok book", rating: 3, user: @user1)
    @book.users << @user1
    @book.reviews << @review1
    @book.reviews << @review2

    visit book_path(@book)
  end

  it "sees the book's title, list of reviews, and the user for each review" do
    expect(page).to have_content @book.title
    expect(page).to have_content @user1.name
    expect(page).to have_content @review1.body
    expect(page).to have_content @review2.body
    expect(page).to have_content @review1.rating
    expect(page).to have_content @review2.rating
  end

  it "can see the average rating for that book" do
    skip
    average = (@review1.rating + @review2.rating).to_f / 2
    expect(page).to have_content 4.0
  end

  it "can see the highest rating for that book" do
    expect(page).to have_content "Highest Rating: 5"
  end

  it "can see the lowest rating for that book" do
    expect(page).to have_content "Lowest Rating: 3"
  end


end
