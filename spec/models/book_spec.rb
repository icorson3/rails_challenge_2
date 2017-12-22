describe Book do
  describe "instance methods" do
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

    it ".average_rating" do
      expect(@book.average_rating).to eq(3)
    end

    it ".best_review" do
      best_review = @book.best_review

      expect(best_review.rating).to eq(@review_1.rating)
      expect(best_review.author).to eq(@review_1.author)
      expect(best_review.body).to eq(@review_1.body)
    end

    it ".worst_review" do
      worst_review = @book.worst_review

      expect(worst_review.rating).to eq(@review_2.rating)
      expect(worst_review.author).to eq(@review_2.author)
      expect(worst_review.body).to eq(@review_2.body)
    end

  end

  describe "relationships" do
    it "has many reviews" do
      book = Book.create(title: "Gravity's Angels")

      expect(book).to respond_to(:reviews)
    end

  end

  describe "validations" do
    it "is invalid without title" do
      book = Book.new()

      expect(book).to be_invalid
    end

    it "is valid with title" do
      book = Book.new(title: "Gravity's Angels")

      expect(book).to be_valid
    end
  end
end
