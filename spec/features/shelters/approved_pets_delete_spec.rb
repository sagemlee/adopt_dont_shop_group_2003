require 'rails_helper'

describe "user tries to delete shelter from shelter index that has approved apps on any pet" do
  it "cannot delete shelter" do
    
    shelter1 = create(:shelter)

    pet1 = create(:pet, shelter_id: "#{shelter1.id}", adoption_status: "pending")
    pet2 = create(:pet, shelter_id: "#{shelter1.id}")
    pet3 = create(:pet, shelter_id: "#{shelter1.id}")

    application1 = create(:application)
    application2 = create(:application)
    application3 = create(:application)

    PetApplication.create!(pet: pet1, application: application1, approved: "true")
    PetApplication.create!(pet: pet1, application: application2)
    PetApplication.create!(pet: pet2, application: application3)
    PetApplication.create!(pet: pet3, application: application3)

    visit "/shelters"

    within("#shelter-#{shelter1.id}") do
      expect(page).to_not have_content("Delete Shelter")
    end 
  end
end

describe "user tries to delete shelter from shelter show that has approved apps on any pet" do
  xit "cannot delete shelter" do
    
    shelter = create(:shelter)
    pet1 = create(:pet, shelter_id: "#{shelter.id}", adoption_status: "pending")
    pet2 = create(:pet, shelter_id: "#{shelter.id}")
    pet3 = create(:pet, shelter_id: "#{shelter.id}")

    visit "/shelters/#{shelter.id}"
    click_button "Delete Shelter"
  end
end

# User Story 26, Shelters with Pets that have pending status cannot be Deleted

# As a visitor
# If a shelter has approved applications for any of their pets
# I can not delete that shelter
# Either:
# - there is no button visible for me to delete the shelter
# - if I click on the delete link for deleting a shelter, 
# I see a flash message indicating that the shelter can not be deleted.
