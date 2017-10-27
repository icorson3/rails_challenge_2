require 'rails-helper'

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

end
