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
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_2.rating)
    expect(page).to have_content(review_1.body)
    expect(page).to have_content(review_2.body)
  end
  it "displays highest and lowest rating" do
    book = Book.create(title: "title")
    review_1 = book.reviews.create(reviewer: "reviewer 1", body: "review 1", rating: 10)
    review_2 = book.reviews.create(reviewer: "reviewer 2", body: "review 2", rating: 1)
    review_3 = book.reviews.create(reviewer: "reviewer 3", body: "review 3", rating: 100)

    visit "/books/#{book.id}"

    expect(page).to have_content("Highest Rating: #{review_3.rating}")
    expect(page).to have_content("Lowest Rating: #{review_2.rating}")
    expect(page).to have_content(review_3.body)
    expect(page).to have_content(review_3.reviewer)
    expect(page).to have_content(review_2.body)
    expect(page).to have_content(review_2.reviewer)
    expect(page).to_not have_content(review_1.body)
  end
end
