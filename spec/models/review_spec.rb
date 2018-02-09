require 'rails_helper'

RSpec.describe Review, type: :model do
  before :each do
    @book ||= Book.create!(title: "Opakawagalaga")
    @user ||= User.create!(name: "Eupanifahorious")
  end
  describe "Validations" do
    it "is invalid without a title" do
      review = Review.create(body: "Da wey", book: @book, user: @user, rating: 3)
      expect(review).to be_invalid
    end

    it "is invalid without a body" do
      review = Review.create(title: "Da wey", book: @book, user: @user, rating: 3)
      expect(review).to be_invalid
    end

    it "is invalid without a book" do
      review = Review.create(body: "Da wey", title: "@no_book", user: @user, rating: 3)
      expect(review).to be_invalid
    end

    it "is invalid without a user" do
      review = Review.create(body: "Da wey", book: @book, title: "@no_user", rating: 3)
      expect(review).to be_invalid
    end

    it "is invalid without a rating" do
      review = Review.create(body: "Da wey", book: @book, title: @user)
      expect(review).to be_invalid
    end

    it "is valid with all required attributes" do
      review = Review.create(title: "Box of Secrets", body: "Da wey", book: @book, user: @user, rating: 5)
      expect(review).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to a user" do
      review = Review.create(title: "Box of Secrets", body: "Da wey", book: @book, user: @user, rating: 5)
      expect(review).to respond_to(:user)
    end

    it "belongs to a book" do
      review = Review.create(title: "Box of Secrets", body: "Da wey", book: @book, user: @user, rating: 5)
      expect(review).to respond_to(:book)
    end
  end
end
