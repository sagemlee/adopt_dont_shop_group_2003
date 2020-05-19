require 'rails_helper'

describe "When user visits shelter show page" do
  it "displays count of pets that are at that shelter" do

    shelter1 = create(:shelter)

    pet1 = create(:pet, shelter_id: "#{shelter1.id}")
    pet2 = create(:pet, shelter_id: "#{shelter1.id}")
    pet3 = create(:pet, shelter_id: "#{shelter1.id}")

    application1 = create(:application)

    PetApplication.create!(pet: pet1, application: application1)

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
      expect(page).to have_content("Average Review Rating: #{shelter1.reviews.average_rating.round(2)}")
    end 
  end
  it "displays number of applications on file for that shelter" do

    shelter1 = create(:shelter)

    pet1 = create(:pet, shelter_id: "#{shelter1.id}")
    pet2 = create(:pet, shelter_id: "#{shelter1.id}")
    pet3 = create(:pet, shelter_id: "#{shelter1.id}")

    application1 = create(:application)
    application2 = create(:application)

    PetApplication.create!(pet: pet1, application: application1)
    PetApplication.create!(pet: pet1, application: application2)

    visit "/shelters/#{shelter1.id}"

     within(".shelter-apps") do
      expect(page).to have_content("Number of Applications on File: #{shelter1.pets.number_of_apps}")
    end 
  end
end