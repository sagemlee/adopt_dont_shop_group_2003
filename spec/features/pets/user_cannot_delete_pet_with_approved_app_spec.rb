require 'rails_helper'

describe "user tries to delete pet, that has an approved application" do
    it "will not see delete button" do

      pet1 = create(:pet)
      pet2 = create(:pet)

      application1 = create(:application)

      PetApplication.create!(application: application1, pet: pet1)
      PetApplication.create!(application: application1, pet: pet2)

      visit "/applications/#{application1.id}"

      within("#pet-#{pet2.id}") do
        click_link "Approve Application for Pet"
      end

      visit '/pets'

      within("#pet-#{pet2.id}") do
        expect(page).to_not have_content("Delete Pet")
      end

      visit '/pets/#{pet2.id}'
      expect(page).to_not have_content("Delete Pet")
    end
end
