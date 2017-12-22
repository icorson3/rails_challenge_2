require 'rails_helper'

RSpec.describe Book
describe "Validations" do
  context "invalid attributes" do
    it "is invalid without a title" do
      book = Book.new

      expect(book).to be_invalid
    end
  end
end
