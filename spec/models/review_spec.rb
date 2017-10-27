require 'rails_helper'

describe Review do
  describe "Associations" do
    it "belongs to a book" do
      review = Review.new(username: "grayton", body: "i really liked this book", rating: 4)
      expect(review).to respond_to(:book)
    end
  end
end
