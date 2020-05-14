FactoryBot.define do
  factory :pet do
    sequence(:name) {|n| "Application #{n}" }
    sequence(:address) { |n| "#{n} street" }
    sequence(:city) {|n| "city #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:phone_number) { |n| "1-800-000#{n}" }
    sequence(:description) { |n| "descryption #{n}" }
    pets_applications
  end
end
