FactoryBot.define do

  factory :book do
    sequence(:title) { |n| "Title #{n}"}
    sequence(:body) { |n| "Body #{n}"}
  end

  factory :user do
    sequence(:name) { |n| "Name #{n}"}
  end

  factory :review do
    sequence(:body) { |n| "Body #{n}" }
    rating 4
    book
    user
  end
end
