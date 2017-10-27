require 'rails_helper'

describe Book do
  it "invalid wihtout a title" do
    book = Book.new

    expect(book).to be_invalid
  end

  it "valid with a title" do
    book = Book.new(title: "Big")

    expect(book).to be_valid
  end

  it "is invalid if title is not unique" do
    Book.create(title: "Big")
    book = Book.create(title: "Big")

    expect(book).to be_invalid
  end

  it "is valid if title is unique" do
    Book.create(title: "Cinderella")
    book = Book.create(title: "Big")

    expect(book).to be_valid
  end

  it "has relationship to review" do
    book = Book.create(title: "Big")

    expect(book).to respond_to(:reviews)
  end
end
