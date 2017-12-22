describe Review do
  describe "instance methods" do
    it ".author" do
      @book = Book.create(title: "Bible")
      @user_1 = User.create(name: "KenM")

      @review_1 = @book.reviews.create(body: "Best story book ever",
                                   user_id: @user_1.id,
                                   rating: 5)

      expect(@review_1.author).to eq(@user_1.name)
    end
  end
  describe "relationships" do
    it "belongs to user" do
      review = Review.new()

      expect(review).to respond_to(:user)
    end

    it "belongs to book" do
      review = Review.new()

      expect(review).to respond_to(:book)
    end
  end
end
