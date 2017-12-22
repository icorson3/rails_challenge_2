describe User do
  describe "relationships" do
    it "has many reviews" do
      user = User.create(name: "max")

      expect(user).to respond_to(:reviews)
    end

  end

  describe "validations" do
    it "is invalid without name" do
      user = User.new()

      expect(user).to be_invalid
    end

    it "is valid with name" do
      user = User.new(name:"Max")

      expect(user).to be_valid
    end
  end
end
