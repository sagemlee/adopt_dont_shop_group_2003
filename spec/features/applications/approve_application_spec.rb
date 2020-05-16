require 'rails_helper'

describe "user visits applications/:application_id" do
  describe "user sees a link next to every pet to approve specific pet" do
    it "it approves pet and takes us back to the pet show page" do

      
      pet1 = create(:pet)
      pet2 = create(:pet)
        
      application1 = create(:application)

      PetApplication.create!(application: application1, pet: pet1) 
      PetApplication.create!(application: application1, pet: pet2) 

      visit "/applications/#{application1.id}"


      expect(page).to have_content(application1.name)
      expect(page).to have_content(application1.address)
      expect(page).to have_content(application1.city)
      expect(page).to have_content(application1.state)
      expect(page).to have_content(application1.zipcode)
      expect(page).to have_content(application1.phone_number)
      expect(page).to have_content(application1.description)
      have_link("#{pet1.name}", :href => "/pets/#{pet1.id}")
      have_link("#{pet2.name}", :href => "/pets/#{pet2.id}")
    end 
  end 
end 