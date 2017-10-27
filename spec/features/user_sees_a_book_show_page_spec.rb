require 'rails_helper'

describe "when a user visits a book show page" do
  it "a user sees a title, reviews, and user rating" do
    user1 = create(:user)
    user2 = create(:user)
    book = create(:book)
    review1 = create(:review, user: user1, book: book)
    review2 = create(:review, user: user2, book: book)
    visit book_path(book)

    expect(page).to have_content("#{book.title}")
    expect(page).to have_content("Reviews(2)")
    expect(page).to have_content("#{user1.name}")
    expect(page).to have_content("#{user2.name}")
    expect(page).to have_content("#{review1.content}")
    expect(page).to have_content("#{review2.content}")
    expect(page).to have_content("#{review1.rating}")
    expect(page).to have_content("#{review2.rating}")
  end

  it "a user sees an average rating for that book" do
    user1 = create(:user)
    user2 = create(:user)
    book = create(:book)
    review1 = create(:review, user: user1, book: book, rating: 3)
    review2 = create(:review, user: user2, book: book, rating: 5)
    visit book_path(book)

    expect(page).to have_content("Average Rating: 4")
  end

  it "a user sees a highest rating for that book" do
    user1 = create(:user)
    user2 = create(:user)
    book = create(:book)
    review1 = create(:review, user: user1, book: book, rating: 3)
    review2 = create(:review, user: user2, book: book, rating: 5)
    visit book_path(book)

    expect(page).to have_content("Highest Rating: 5")
  end

  it "a user sees a lowest rating for that book" do
    user1 = create(:user)
    user2 = create(:user)
    book = create(:book)
    review1 = create(:review, user: user1, book: book, rating: 3)
    review2 = create(:review, user: user2, book: book, rating: 5)
    visit book_path(book)

    expect(page).to have_content("Lowest Rating: 3")
  end
end
