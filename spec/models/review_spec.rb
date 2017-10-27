require 'rails_helper'

describe Review do

  describe 'validations' do

    it 'pass with a body, rating, user, and book' do
      review = Review.new(
        book: create(:book),
        user: create(:user),
        body: "Best book about birds!",
        rating: 4
      )
      expect(review).to be_valid
    end

    it 'fail without a book' do
      review = Review.new(
        user: create(:user),
        body: "Best book about birds!",
        rating: 4
      )
      expect(review).to_not be_valid
    end

    it 'fail without a user' do
      review = Review.new(
        book: create(:book),
        body: "Best book about birds!",
        rating: 4
      )
      expect(review).to_not be_valid
    end

    it 'fail without a body' do
      review = Review.new(
        book: create(:book),
        user: create(:user),
        rating: 4
      )
      expect(review).to_not be_valid
    end

    it 'fail without a rating' do
      review = Review.new(
        book: create(:book),
        user: create(:user),
        body: "Best book about birds!"
      )
      expect(review).to_not be_valid
    end

  end

  describe 'relations' do

    it 'belongs to a user' do
      review = create(:review)
      expect(review.user).to be_a User
    end

    it 'belongs to a book' do
      review = create(:review)
      expect(review.book).to be_a Book
    end

  end

end
