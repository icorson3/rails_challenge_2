feature "When someone visits a book's show page" do

  background do
    book = create(:book, title: "Grimus", id: 1)
  end

  scenario "they see that book's title" do
    visit book_path(1)
    expect(page).to have_content("Grimus")
  end

  describe "they see ratings" do
    background do
      1.upto(4){ |n| create(:review, book_id: 1, rating: n) }
    end

    scenario "including a header that includes the highest rating for that book" do
      expect(page).to have_content("Highest Rating: 4")
    end
    scenario "including a header that includes the lowest rating for that book" do
      expect(page).to have_content("Lowest Rating: 1")
    end
  end

  describe "they see a list of reviews for that book" do
    background do
      Reveiew.create!(
        book_id: 1,
        body: "Best book about birds!",
        rating: 4,
        user: User.create(name: 'Joseph Anton')
      )
      vist book_path(1)
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
