# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 book1 = Book.create(title: "Last of the mohicans")
 book2 = Book.create(title: "First of the Mohicans")
 book3 = Book.create(title: "Scarlett Letter")
 book4 = Book.create(title: "Left Hand of Darkness")
 book5 = Book.create(title: "Right Hand of Darkness")
 book6 = Book.create(title: "Mary Poppinns")


 user1 = User.create(name: "Tom")
 user2 = User.create(name: "Jen")
 user3 = User.create(name: "Sara")
 user4 = User.create(name: "Sam")
 user5 = User.create(name: "Bob")
 user6 = User.create(name: "Rachel")


review1 = user1.reviews.create(body: 'it was awful', rating: '' )
