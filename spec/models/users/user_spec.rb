require "rails_helper"

describe User do
  describe "Validations" do
    it "is invalid without a name" do
      user = User.new

      expect(user).to be_invalid
    end

    it "is valid with a name" do
      user = User.create!(name: "Opakawagalaga")

      expect(user).to be_valid
    end
  end
end
