require "rails_helper"

describe "When the User navigates to the book show page" do
  it "the User can see the show page" do
    book = Book.create(title: "The BFG")

    visit book_path(book)

    expect(page).to have_content("The BFG")
    
  end


end
