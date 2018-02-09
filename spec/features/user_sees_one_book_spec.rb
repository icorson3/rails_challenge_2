require "rails_helper"

describe "User sees one book" do
  it "displays book title, list of reviews and ratings" do
    book = Book.create(title: "title")
    review_1 = book.reviews.create(reviewer: "reviewer 1", body: "review 1", rating: 10)
    review_2 = book.reviews.create(reviewer: "reviewer 2", body: "review 2", rating: 1)
    visit "/books/#{book.id}"

    expect(page).to have_content(book.title)
    expect(page).to have_content(review_1.reviewer)
    expect(page).to have_content(review_2.reviewer)
    expect(page).to have_content(review_2.rating)
    expect(page).to have_content(review_2.rating)
  end
end
