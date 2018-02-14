require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "relationships" do
    it {should have_many(:reviews) }
  end

  describe "instance methods" do
    it "#average_rating returns books with their average rating" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)
      review_2 = book.reviews.create!(user_name: "molly",
                                      body: "I did not enjoy this one!",
                                      rating: 1)

      expect(book.average_rating).to eq(3)
    end

    it "#highest_rating_rating returns highest rating review of book" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)
      review_2 = book.reviews.create!(user_name: "molly",
                                      body: "I did not enjoy this one!",
                                      rating: 1)

      expect(book.highest_rating_review).to eq(review_1)
    end

    it "#lowest_rating_review returns lowest rating review of book" do
      book = Book.create!(title: "Catcher in the Rye")
      review_1 = book.reviews.create!(user_name: "Billy",
                                      body: "I enjoyed this one!",
                                      rating: 5)
      review_2 = book.reviews.create!(user_name: "sally",
                                      body: "I didn't enjoyed this one!",
                                      rating: 4)
      review_3 = book.reviews.create!(user_name: "molly",
                                      body: "I did not enjoy this one!",
                                      rating: 1)

      expect(book.lowest_rating_review).to eq(review_3)
    end
  end
end
