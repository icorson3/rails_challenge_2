require "rails_helper"
describe "when a user visits a book's show page" do
  it "they see the book's title" do
		book = Book.create(title: "The Brothers Karamazov")
		visit "/books/#{book.id}" 

		expect(page).to have_content("The Brothers Karamazov")
	end 

	it "they also see a list of reviews" do
		book = Book.create(title: "The Brothers Karamazov")
		review1 = Review.create(body: "People are really dramatic", rating: 5)

		expect(page).to have_content("People are really dramatic")
		expect(page).to have_content(5)
	end 
end 
