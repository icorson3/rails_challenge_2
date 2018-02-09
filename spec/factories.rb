FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Challenge of the Wailing Badger: No. #{n}"}
  end

  factory :user do
    sequence(:name) { |n| "Kira Montfloral Esq. the #{n}"}
  end

  factory :review do
    sequence(:rating) { |n| "#{n}"}
    book
    user
  end
  
end
