FactoryBot.define do
  factory :review do
    sequence(:title) {|n| "Review #{n}" }
    sequence(:rating) { |n| 1 + n }
    sequence(:content) {|n| "Content #{n}" }
    sequence(:img_url) { |n| "http://img.com/#{1 + n}" }
  end
end
