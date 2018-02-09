require "rails_helper"

describe User do
  describe "Validations" do
    it "is invalid without a name" do
      user = User.new

      expect(user).to be_invalid
    end

    it "is valid with a name" do
      user = User.create!(name: "Eupanifahorious")

      expect(user).to be_valid
    end
  end

  describe "Relationships" do
    it "has many reviews" do
      user = User.create!(name: "Eupanifahorious")
      expect(user).to respond_to(:reviews)
    end
  end
end
