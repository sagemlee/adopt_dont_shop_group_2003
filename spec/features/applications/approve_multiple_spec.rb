require 'rails_helper'

describe "user creates application for more than one pet" do
  describe "visits application show page" do
    it "can approve any number of pets" do
      pet1 = create(:pet)
      pet2 = create(:pet)

      application1 = create(:application)

      PetApplication.create!(application: application1, pet: pet1)
      PetApplication.create!(application: application1, pet: pet2)

      visit "/applications/#{application1.id}"

      within("#pet-#{pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{application1.id}"

      within("#pet-#{pet2.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/pets/#{pet1.id}"
      expect(page).to have_content("pending")
      visit "/pets/#{pet2.id}"
      expect(page).to have_content("pending")
    end
  end
end
