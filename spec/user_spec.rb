require 'rails_helper'

describe User do
  it "invalid wihtout a name" do
    user = User.new

    expect(user).to be_invalid
  end

  it "valid with a name" do
    user = User.new(name: "Dee")

    expect(user).to be_valid
  end

  it "is invalid if name is not unique" do
    User.create(name: "Dee")
    user = User.create(name: "Dee")

    expect(user).to be_invalid
  end

  it "is valid if name is unique" do
    User.create(name: "Ann")
    user = User.create(name: "Dee")

    expect(user).to be_valid
  end

  it "has relationship to review" do
    user = User.create(name: "Dee")

    expect(user).to respond_to(:reviews)
  end

  it "has relationship to review" do
    user = User.create(name: "Dee")

    expect(user).to respond_to(:books)
  end
end
