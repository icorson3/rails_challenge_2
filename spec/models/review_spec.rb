require 'rails_helper'

RSpec.describe Review, type: :model do
  before :each do
    @book ||= Book.create!(title: "Opakawagalaga")
    @user ||= User.create!(name: "Eupanifahorious")
  describe "Validations" do
    it "is invalid with a title" do
      review = Review.create(body: "Da wey", book: @book, user: @user)
      expect(review).to be_invalid
    end

    it "is invalid with a body" do
      review = Review.create(title: "Da wey", book: @book, user: @user)
      expect(review).to be_invalid
    end

    it "is invalid with a book" do
      review = Review.create(body: "Da wey", title: "@no_book", user: @user)
      expect(review).to be_invalid
    end

    it "is invalid with a user" do
      review = Review.create(body: "Da wey", book: @book, title: "@no_user")
      expect(review).to be_invalid
    end

    it "is valid with all required attributes" do
      review = Review.create(title: "Box of Secrets", body: "Da wey", book: @book, user: @user)
      expect(review).to be_valid
    end
  end
end
