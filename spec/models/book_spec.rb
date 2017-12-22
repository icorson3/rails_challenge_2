require "rails_helper"

describe Book do
  it "responds to reviews" do
    book = Book.new(title: "Harry Potter")

    expect(book).to respond_to(:reviews)
  end
end