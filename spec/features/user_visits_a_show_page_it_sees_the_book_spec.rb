require 'rails_helper'

describe "when the user visits the show page" do
  it "sees the title of the book" do
    user = User.create(name: "Miguel")
    book = Book.create(title: "The Best")
    review = Review.create(book_id: book.id, rating: 4, body: "The greatest book ever", user_id: user.id)

    visit book_path(book)

    expect(page).to have_content("The Best")
  end
  it "sees the review of the book and the rating" do
    user = User.create(name: "Miguel")
    book = Book.create(title: "The Best")
    review = Review.create(book_id: book.id, rating: 4, body: "The greatest book ever", user_id: user.id)
    # byebug
    visit book_path(book)

    expect(page).to have_content("The greatest book ever")
    expect(page).to have_content(4)
    expect(page).to have_content("Miguel")
  end
end

describe "when the user visit the page" do
  it "sees the average ratin of the book" do
    user = User.create(name: "Miguel")
    book = Book.create(title: "The Best")
    review = Review.create(book_id: book.id, rating: 4, body: "The greatest book ever", user_id: user.id)
    review = Review.create(book_id: book.id, rating: 2, body: "The worst.", user_id: user.id)
    # byebug
    visit book_path(book)

    expect(page).to have_content(3)
    expect(page).to have_content(4)
    expect(page).to have_content(2)
  end
end
