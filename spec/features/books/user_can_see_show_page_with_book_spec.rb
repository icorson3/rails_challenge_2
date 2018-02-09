require 'rails_helper'

  describe "User visits show page"  do
    describe "User expects to see a certian book"  do
      it "The correct book is shown" do
        book = Book.create!(title: "Harry Potter")
        visit book_path

        expect(page).to have_content("Harry Potter")
      end
    end
  end
end
