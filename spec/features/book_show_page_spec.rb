feature "When someone visits a book's show page" do

  background do
    book = Book.create!(title: "Grimus")
    visit book_path(book)
  end

  scenario "they see that book's title" do
    expect(page).to have_content("Grimus")
  end

  describe "they see a list of reviews for that book" do
    background do
      Reveiew.create!(
        book: Book.last,
        body: "Best book about birds!",
        rating: 4,
        user: User.create(name: 'Joseph Anton')
      )
      vist book_path(Book.last)
    end
    scenario "including the body" do
      expect(page).to have_content("Best book about birds!")
    end
    scenario "including the user that created that review" do
      expect(page).to have_content("Joseph Anton")
    end
    scenario "including the rating for that the user gave the book." do
      expect(page).to have_content("4/5")
    end
  end

end
