require "rails_helper"

describe Book, type: :model do
  it "can find highest or lowest review for an instance of itself" do
    book = Book.create(title: "title")
    review_1 = book.reviews.create(reviewer: "reviewer 1", body: "review 1", rating: 10)
    review_2 = book.reviews.create(reviewer: "reviewer 2", body: "review 2", rating: 1)
    review_3 = book.reviews.create(reviewer: "reviewer 3", body: "review 3", rating: 100)

    expect(review_2).to eq(book.lowest_review)
    expect(review_3).to eq(book.highest_review)
  end
  it "can find average rating for an instance of itself" do
    book = Book.create(title: "title")
    review_1 = book.reviews.create(reviewer: "reviewer 1", body: "review 1", rating: 10)
    review_2 = book.reviews.create(reviewer: "reviewer 2", body: "review 2", rating: 1)
    review_3 = book.reviews.create(reviewer: "reviewer 3", body: "review 3", rating: 100)

    expect(book.avg_rating).to eq(37.0)
  end
end
