require 'rails_helper'

describe "user sees one application" do
  describe "they visit /applications/:application_id" do
    it "displays the application and the pets it is applying for" do

      pet1 = create(:pet)
      pet2 = create(:pet)
        
      application1 = create(:application)

      PetApplication.create!(application: application1, pet: pet1) 
      PetApplication.create!(application: application1, pet: pet2) 

      visit "/applications/#{application1.id}"

      within("#pet-#{pet2.id}") do
        expect(page).to have_content("Approve Application for Pet")
      end

      within("#pet-#{pet1.id}") do
        click_link "Approve Application for Pet"
      end

      expect(current_path).to eq("/pets/#{pet1.id}")

      expect(page).to have_content("pending")
      # expect(page).to have_content("On hold for #{application1.name}")
    end
  end
end

# User Story 22, Approving an Application

# As a visitor
# When I visit an application's show page
# For every pet that the application is for, I see a link to approve
# the application for that specific pet
# When I click on a link to approve the application for one particular pet
# I'm taken back to that pet's show page
# And I see that the pets status has changed to 'pending'
# And I see text on the page that says who this pet is on hold for 
# (Ex: "On hold for John Smith", given John Smith is the name on the 
# application that was just accepted)