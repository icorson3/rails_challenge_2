require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Class Methods' do
    before :each do
      user1 = create(:user)
      user2 = create(:user)
      @book = create(:book)
      review1 = create(:review, user: user1, book: @book, rating: 3)
      review2 = create(:review, user: user2, book: @book, rating: 5)
    end

    it "finds average book rating" do
      expect(@book.reviews.average_book_rating).to eq(4)
    end

    it "finds max book rating" do
      expect(@book.reviews.max_min_book_rating("DESC")).to eq(5)
    end

    it "finds min book rating" do
      expect(@book.reviews.max_min_book_rating("ASC")).to eq(3)
    end
  end
end
