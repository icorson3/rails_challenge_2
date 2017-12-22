require 'spec helper'

describe "a user visits a book show page" do
  context "the book has been given ratings" do
    it "the user sees the average rating for that book" do
      book = Book.new(title: "Old Man and the Sea")
      user = User.new(name: "John")
      
