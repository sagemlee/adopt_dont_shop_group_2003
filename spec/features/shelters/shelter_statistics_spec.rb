require 'rails_helper'

describe "When user visits shelter show page" do
  it "displays count of pets that are at that shelter" do

    shelter1 = create(:shelter)

    pet1 = create(:pet, shelter_id: "#{shelter1.id}")
    pet2 = create(:pet, shelter_id: "#{shelter1.id}")
    pet3 = create(:pet, shelter_id: "#{shelter1.id}")

    visit "/shelters/#{shelter1.id}"

    within(".shelter-count") do
      expect(page).to have_content("Number of Pets at Shelter: #{shelter1.pets.count_of_pets}")
    end 
  end
  it "displays average shelter review rating" do

    shelter1 = create(:shelter)

    review1 = create(:review, shelter_id: "#{shelter1.id}", rating: "5")
    review2 = create(:review, shelter_id: "#{shelter1.id}", rating: "10")
    review2 = create(:review, shelter_id: "#{shelter1.id}", rating: "7")

    visit "/shelters/#{shelter1.id}"

     within(".shelter-average") do
      expect(page).to have_content("Average Review Rating: #{shelter1.reviews.average_rating}")
    end 
  end
  it "displays number of applications on file for that shelter" do
  end
end

# User Story 30, Shelter Statistics

# As a visitor
# When I visit a shelter's show page
# I see statistics for that shelter, including:
# - count of pets that are at that shelter
# - average shelter review rating
# - number of applications on file for that shelter