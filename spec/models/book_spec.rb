require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "relationships" do
    it {should have_many(:reviews) }
  end
end
