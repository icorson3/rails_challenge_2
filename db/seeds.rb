# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Books = ["Fellow", "1989", "Harry Potter", "Forever War", "Foundation", "Tubes"]
Users = ["Kyle", "Jack", "Anna", "Kara", "Ben", "Jake"]



Books.each do |book|
  book = Book.create!(title: book)
  puts "Created #{book.title}"
end
