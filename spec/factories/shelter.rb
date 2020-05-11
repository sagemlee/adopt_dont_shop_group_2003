FactoryBot.define do
  factory :shelter do
    sequence(:name) {|n| "Shelter #{n}" }
    sequence(:address) {|n| "#{n} Shelter Ave" }
    sequence(:city) {|n| "#{n} City" }
    sequence(:state) {|n| "#{n} State" }
    sequence(:zip) {|n| "#{n} Zip" }
  end
end
