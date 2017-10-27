require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { Book.new(title: 'cool book') }

  context "validations" do
    it { should validate_presence_of(:title) }
  end

  context "relationships" do
    it { should have_many(:reviews) }
  end
end