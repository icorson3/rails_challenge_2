require 'rails_helper'

describe Review do
  describe "relationships" do
    it "belongs to a book" do
      review = Review.create(body: "great book")
      expect(review).to respond_to(:book)
    end

    it "belongs to a user" do
      review = Review.create(body: "great book")
      expect(review).to respond_to(:user)
    end
  end
end
