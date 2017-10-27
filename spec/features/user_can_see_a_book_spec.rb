require 'rails_helper'

describe "User sees a book page" do

  before do
    book = Book.create!(id: 1, title: "Throne of Glass")
    User.create!(id: 1, name: "User 1")
    User.create!(id: 2, name: "User 2")
    User.create!(id: 3, name: "User 3")
    Review.create!(rating: 1, content: "this book sucks", user_id: 1, book_id: 1)
    Review.create!(rating: 3, content: "meh", user_id: 2, book_id: 1)
    Review.create!(rating: 5, content: "this book is AMAZING", user_id: 3, book_id: 1)
    visit book_path(book)
  end

  scenario "the book has a title" do
    expect(page).to have_content("Throne of Glass")
  end

  scenario "the book has reviews" do
    expect(page).to have_content("Reviews")
    expect(page).to have_content("this book sucks")
    expect(page).to have_content("meh")
    expect(page).to have_content("this book is AMAZING")
  end

  scenario "the book has an average rating" do
    save_and_open_page
    expect(page).to have_content("Average Rating: 3")
  end

  scenario "the book has a highest rating and review" do
    expect(page).to have_content("Lowest Rating: 1")
    expect(page).to have_content("Reviewer: User 1")
    expect(page).to have_content("this book sucks")
  end

  scenario "the book has a lowest rating and review" do
    expect(page).to have_content("Highest Rating: 5")
    expect(page).to have_content("Reviewer: User 3")
    expect(page).to have_content("this book is AMAZING")
  end
end
