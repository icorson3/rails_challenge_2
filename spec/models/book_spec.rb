require "rails_helper"

describe Book do
  describe "validations"do
    context "invalid attributes" do
      it "is invalid without a title" do
        book = Book.new

        expect(book).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with title" do
        book = Book.new(title: "title")

        expect(book).to be_valid
      end
    end
  end
end
