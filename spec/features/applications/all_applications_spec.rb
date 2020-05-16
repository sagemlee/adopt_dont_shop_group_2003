require 'rails_helper'

describe "user visits pets/:pet_id" do
  describe "clicks link to view applications for pet" do
    it "displays a list of all applications for this pet" do

      pet1 = create(:pet)
        
      application1 = create(:application)
      application2 = create(:application)

      PetApplication.create!(application: application1, pet: pet1) 
      PetApplication.create!(application: application2, pet: pet1) 

      visit "/pets/#{pet1.id}"

      within("#pet-#{pet1.id}") do
        click_link "See applications"
      end

      expect(current_path).to eq("/pets/#{pet1.id}/applications")

      have_link("#{application1.name}", :href => "/applications/#{application1.id}")
      have_link("#{application2.name}", :href => "/applications/#{application2.id}")
    end
    
    it "displays that there are no applications for this pet when pet has no applications" do
      pet1 = create(:pet)
        
      application1 = create(:application)

      visit "/pets/#{pet1.id}/applications/"

      expect(page).to have_content("This pet has no applications")
      expect(page).to_not have_content(application1.name)
    end 
  end 
end 
