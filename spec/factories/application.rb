FactoryBot.define do
  factory :application do
    sequence(:name) {|n| "Application #{n}" }
    sequence(:address) { |n| "#{n} street" }
    sequence(:city) {|n| "city #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:phone_number) { |n| "1-800-000#{n}" }
    sequence(:description) { |n| "descryption #{n}" }
    association :pet, factory: :pet
  end
end
