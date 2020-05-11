FactoryBot.define do
  factory :pet do
    sequence(:name) {|n| "Animal #{n}" }
    sequence(:age) { |n| 1 + n }
    sequence(:sex) {|n| "male" }
    sequence(:img_url) { |n| "http://img.com/#{1 + n}" }
    adoption_status { "adoptable" }
    description { "cute" }
    shelter
  end
end
