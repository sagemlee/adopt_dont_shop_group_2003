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
      expect(page).to have_content("On hold for #{application1.name}")

      visit "/pets/#{pet2.id}"
      expect(page).to_not have_content("On hold for #{application1.name}")

    end
    it "does not display approval button for an application for a pet whom already has an approval" do
      pet1 = create(:pet)

      application1 = create(:application)
      application2 = create(:application)

      PetApplication.create!(application: application1, pet: pet1)
      PetApplication.create!(application: application2, pet: pet1)

      visit "/applications/#{application1.id}"

      within("#pet-#{pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{application2.id}"

      within("#pet-#{pet1.id}") do
        expect(page).to_not have_link("Approve Application for Pet")
      end
    end

    it "shows link to unapprove previously approved pets" do
      pet1 = create(:pet)

      application1 = create(:application)

      PetApplication.create!(application: application1, pet: pet1)

      visit "/applications/#{application1.id}"

      within("#pet-#{pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{application1.id}"

      within("#pet-#{pet1.id}") do
        expect(page).to_not have_link("Approve Application for Pet")
        click_link("Unapprove Application for Pet")
      end

      expect(current_path).to eq("/applications/#{application1.id}")

      within("#pet-#{pet1.id}") do
        expect(page).to have_link("Approve Application for Pet")
        expect(page).to_not have_link("Unapprove Application for Pet")
      end

      visit "/pets/#{pet1.id}"
      expect(page).to have_content("adoptable")
      expect(page).to_not have_content("On hold for #{application1.name}")
    end
  end
end
