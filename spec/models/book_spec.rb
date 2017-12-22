describe Book do
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
