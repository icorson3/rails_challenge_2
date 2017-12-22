require 'rails_helper'

describe "user can write book reviews" do
  context "when a user goes to the book show page" do
    context "they fill out the form to write a review" do
      it "should show the review in the book show page" do
        book = Book.create!(title: "Harry Potter")
        visit book_path(book)

        fill_in "review[name]", with: "Gabe"
        fill_in "review[body]", with: "This book was great!"
        click_on "Create Review"

        expect(page).to have_content("This book was great!")
      end
    end
  end
end
