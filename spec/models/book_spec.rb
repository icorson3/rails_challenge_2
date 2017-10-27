require 'rails_helper'

describe Book do

  describe 'validations' do

    it 'pass with a title' do
      book = Book.new(title: 'title')
      expect(book).to be_valid
    end

    it 'fail without a title' do
      book = Book.new
      expect(book).to be_invalid
    end

  end

  describe 'relations' do

    it 'has many reviews' do
      book = create(:book)
      create(:review, book: book)
      expect(book.reviews.first).to be_a Review
    end

  end

end
