# list of reviews for that book, including the body and the user that created that review. I also see the rating (1-5; you do not need to validate that this falls within this range) that the user gave the book.
#
# When I visit the book show page, I see the average rating for that book.
#
# When I visit the book show page, I see a header that includes the highest rating for that book (e.g "Highest Rating: 4").
#
# When I visit the book show page, I see a header that includes the lowest rating for that book (e.g "Lowest Rating: 1").
#
# When I visit the book show page, under the header for highest rating, I see the body of that review and the name of the reviewer that submitted that review.
#
# When I visit the book show page, under the header for lowest rating, I see the body of that review and the name of the reviewer that submitted that review.

require 'rails_helper'

describe "User sees a book page" do

  # let (:book) { Book.create!(id: 1, title: "Throne of Glass") }
  # let (:user1) { User.create!(id: 1, name: "User 1") }
  # let (:user2) { User.create!(id: 2, name: "User 2") }
  # let (:user3) { User.create!(id: 3, name: "User 3") }

  before do
    book = Book.create!(id: 1, title: "Throne of Glass")
    user1 = User.create!(id: 1, name: "User 1")
    user2 = User.create!(id: 2, name: "User 2")
    user3 = User.create!(id: 3, name: "User 3")
    Review.create!(rating: 1, content: "this book sucks", user_id: 1, book_id: 1)
    Review.create!(rating: 3, content: "meh", user_id: 2, book_id: 1)
    Review.create!(rating: 5, content: "this book is AMAZING", user_id: 3, book_id: 1)
    visit book_path(book)
  end

  scenario "the book has a title" do
    expect(page).to have_content("Throne of Glass")
  end

  scenario "the book has reviews" do
    save_and_open_page
    expect(page).to have_content("Reviews")
    expect(page).to have_content("this book sucks")
    expect(page).to have_content("meh")
    expect(page).to have_content("this book is AMAZING")

  end

  scenario "the book has an average rating" do

  end

  scenario "the book has a highest rating and review" do

  end

  scenario "the book has a lowest rating and review" do

  end

  scenario "the book has a title" do

  end
end
