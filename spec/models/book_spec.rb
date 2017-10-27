require "rails_helper"

describe Book do
  it "responds to reviews" do
    book = Book.new(title: "The Best")

    expect(book).to respond_to(:reviews)
  end
end
