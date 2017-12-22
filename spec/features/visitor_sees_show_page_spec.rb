require 'rails_helper'

describe "As a visitor" do
  describe "when i go to book show page" do
    before :each do
      @user = User.create!(name: "Tim")
      @user_2 = User.create!(name: "James")
      @user_3 = User.create!(name: "Stella")

      @book = Book.create!(title: "Barnia")

      @review_1 = @user.reviews.create!(review_title: "jesus", body: "Terrible", author: @user.name, rating: 1, book: @book)

      @review_2 = @user_2.reviews.create!(review_title: "Sooo Hot right now", body: "Great", rating: 5, book: @book, author: @user_2.name)
      @review_3 = @user_3.reviews.create!(review_title: "Lukewarm", body: "ok",  rating: 3, book: @book, author: @user_3.name)

      visit book_path(@book)

    end

    it "displays book title, list of reviews for that book, the body of the review, the user who created taht review, and it also displays rating" do


      expect(page).to have_content("jesus")
      expect(page).to have_content("Sooo Hot right now")
      expect(page).to have_content("Lukewarm")

      expect(page).to have_content("Terrible")
      expect(page).to have_content("Sooo Hot right now")
      expect(page).to have_content("ok")

      expect(page).to have_content("Tim")
      expect(page).to have_content("James")
      expect(page).to have_content("Stella")

      expect(page).to have_content(1)
      expect(page).to have_content(5)
      expect(page).to have_content(3)

    end

    it 'displays the average rating for that book' do
      expect(page).to have_content("Average Rating:")
      expect(page).to have_content(3)
    end

    it "displays highest rating for that book as well as the author and body of review" do
      expect(page).to have_content("Highest Rating:")
      expect(page).to have_content(5)

      expect(page).to have_content("James")
      expect(page).to have_content("Great")
    end

    it "displays loweest rating for that book as well as the author and body of that review" do
      expect(page).to have_content("Lowest Rating:")
      expect(page).to have_content(1)

      expect(page).to have_content("Tim")
      expect(page).to have_content("Terrible")
    end
  end
end
