require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should have_many(:reviews)}
  end
  describe "instance methods" do
    it "should return averate rating" do
      book = create(:book)
      user = create(:user)
      review = create(:review, rating: 5, user: user, book: book)
      review3 = create(:review, rating: 10, user: user, book: book)
      review2 = create(:review, rating: 2, user: user, book: book)
      
      expect(book.average_rating).to eq((5+10+2)/3)
    end
  end
end
