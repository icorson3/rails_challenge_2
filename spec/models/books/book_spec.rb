require "rails_helper"

describe Book do
  describe "Validations" do
    it "is invalid without a title" do
      book = Book.new

      expect(book).to be_invalid
    end

    it "is valid with a title" do
      book = Book.create!(title: "Opakawagalaga")

      expect(book).to be_valid
    end
  end
end
