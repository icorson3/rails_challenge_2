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
                                      
      average_ratings = Book.average_ratings
      book_average_rating = average_ratings.find(book.id).avg_rating

      expect(book_average_rating).to eq(3)
    end
  end
end
