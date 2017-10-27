FactoryBot.define do
  factory :review do
    sequence(:content) {|n| "Content #{n}" }
    sequence(:rating) {|n| "Rating #{n}" }
    book
    user
  end
end
