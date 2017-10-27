require 'rails_helper'

describe "User visits book show page" do
    before :each do
        @book = Book.create(title: "Game of Thrones")
        @review1 = @book.reviews.create(user: "Erika", body: "Great book!", rating: 4)
        @review2 = @book.reviews.create(user: "Allison", body: "Ok book", rating: 2)

        visit book_path(@book)
    end
    
    it "I see page with attributes and ratings" do
        expect(page).to have_content("#{@book.title}")
        expect(page).to have_content("Reviews:")
        expect(page).to have_content("#{@review1.user}")
        expect(page).to have_content("#{@review1.body}")
        expect(page).to have_content("#{@review1.rating}")
    end

    it "I see an average book rating" do
        expect(page).to have_content("Average Rating: 3")
    end

    it "I see the highest and lowest rating" do
        expect(page).to have_content("Highest Rating: 4")
        expect(page).to have_content("Lowest Rating: 2")
    end

    it "I see the highest and lowest rated reviews" do
        expect(page).to have_content("Highest Rating: 4 User: Erika")
        expect(page).to have_content("Lowest Rating: 2 User: Allison")

    end

end