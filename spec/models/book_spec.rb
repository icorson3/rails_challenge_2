require 'rails_helper'

describe Book do
  describe "relationships" do
    it "has many reviews" do
      book = Book.create(title: "Little Women")
      expect(book).to respond_to(:reviews)
    end
  end
end
