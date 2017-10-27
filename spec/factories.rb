FactoryBot.define do

  factory :user do
    name { Faker::Internet.user_name }
  end

  factory :book do
    title { Faker::Book.title }
  end

  factory :review do
    user
    book
    rating { rand(1..5) }
    body { Faker::Hipster.sentence(1, false, 4) }
  end

end
