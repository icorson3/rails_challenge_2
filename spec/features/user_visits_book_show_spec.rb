describe "User visits book show page" do
  context "sees book title and reviews" do
    before(:all) do
      @book = Book.create(title: "Bible")
      @user_1 = User.create(name: "KenM")
      @user_2 = User.create(name: "Max")

      @review_1 = @book.reviews.create(body: "Best story book ever",
                                   user_id: @user_1.id,
                                   rating: 5)
      @review_2 = @book.reviews.create(body: "Does not give water to wine recipe",
                                     user_id: @user_2.id,
                                     rating: 1)
    end

    it "including review: body, user, rating" do
      visit book_path(@book)

      expect(current_path).to eq("/books/#{@book.id}")
      expect(page).to have_content(@book.title)
      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@review_1.body)
      expect(page).to have_content(@review_1.rating)
      expect(page).to have_content(@user_2.name)
      expect(page).to have_content(@review_2.body)
      expect(page).to have_content(@review_2.rating)
    end

    it "has average book rating" do
      visit book_path(@book)

      expect(page).to have_content("Average rating: 3")
    end

    it "has highest book rating, with body and user of review" do
      visit book_path(@book)

      within ".highest_rating" do
        expect(page).to have_content("Highest Rating: #{@review_1.rating}")
        expect(page).to have_content("Author: #{@review_1.author}")
        expect(page).to have_content("Body: #{@review_1.body}")
      end
    end

    it "has lowest book rating, with body and user of review" do
      visit book_path(@book)

      within ".lowest_rating" do
        expect(page).to have_content("Lowest Rating: #{@review_2.rating}")
        expect(page).to have_content("Author: #{@review_2.author}")
        expect(page).to have_content("Body: #{@review_2.body}")
      end
    end
  end
end
