require "rails_helper"

describe Review, type: :model do
  describe "validations" do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:rating)}
  end


end
