require "rails_helper"

describe "iser sees book show page" do
  describe "user can see show page for existing book" do
    it "shows book title and reviews" do
      book = Book.create

    end




    # When I visit a book show page,
    # I see the book title and a list of reviews for that book,
    # including the body and the user that created that review.
    # I also see the rating (1-5; you do not need to validate that this falls within this range)
    #   that the user gave the book.
