require 'rails_helper'

desribe "When a user visits the show page" do
  before(:each) do
    visit book_path
  end

  scenario "the user sees the header" do
    it "sees the highest rating for that book with its review" do
      expect(page).to have_content("Highest Rating: #{@book.rating.max}")
      # make a review here
      expect(page).to have_content("Comment by:")
      expect(page).to have_content("body")
    end

    it "sees the lowest rating for that book with its review" do
      expect(page).to have_content("Lowest Rating: #{@book.rating.min}")
      # make a review here
      expect(page).to have_content("Comment by:")
      expect(page).to have_content("body")
    end
  end

  scenario "the user sees the body" do
    it "sees the book title" do
      expect(page).to have_content("#{@book.title}")
    end

    it "sees the average rating for that book" do
      expect(page).to
      # make methods for min max avg ratings
      have_content("#{@book.rating.sum / @book.rating.count}")
    end

    it "sees a list of reviews" do
      # make reviews here
      expect(page).to have_content("Comment by: ")
      expect(page).to have_content("Comment by: ")
      expect(page).to have_content("Comment by: ")
    end
  end
end
