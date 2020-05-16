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
