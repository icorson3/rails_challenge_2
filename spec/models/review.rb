require 'rails-helper'

describe Review do

  describe 'validations' do

    it 'pass with a body, rating, user, and book' do
      review = Reveiew.new(
        book: create(:book),
        user: create(:user),
        body: "Best book about birds!",
        rating: 4
      )
      expect(review).to be_valid
    end

    it 'fail without a book' do
      review = Reveiew.new(
        user: create(:user),
        body: "Best book about birds!",
        rating: 4
      )
      expect(review).to_not be_valid
    end

    it 'fail without a user' do
      review = Reveiew.new(
        book: create(:book),
        body: "Best book about birds!",
        rating: 4
      )
      expect(review).to_not be_valid
    end

    it 'fail without a body' do
      review = Reveiew.new(
        book: create(:book),
        user: create(:user),
        rating: 4
      )
      expect(review).to_not be_valid
    end

    it 'fail without a rating' do
      review = Reveiew.new(
        book: create(:book),
        user: create(:user),
        body: "Best book about birds!"
      )
      expect(review).to_not be_valid
    end

  end

end
