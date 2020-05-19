require 'rails_helper'

describe "user sees all favorites" do
  describe "they visit /favorites" do
    it "displays all favorite pets" do

      pet1 = create(:pet)
      pet2 = create(:pet)

      visit "/pets/#{pet1.id}"

      click_button "Add Pet to Favorites"

      visit "/pets/#{pet2.id}"

      click_button "Add Pet to Favorites"

      visit "/favorites/"

      expect(page).to have_content(pet1.name)
      expect(page).to have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
      expect(page).to have_content(pet2.name)
      expect(page).to have_xpath("//img[@src = '#{pet2.img_url}' and @alt= '#{pet2.id}']")
    end
  end
end

describe "user visits favorites page" do
  describe "user has no favorite pets" do
    it "displays text saying user has no favorite pets" do

      visit "/favorites/"

      expect(page).to have_content("You have no favorite pets")
    end
  end
end

describe "user visits favorites index page" do
  describe "one or more applications have been created" do
    it "displays section of pets with applications" do

      pet1 = create(:pet)
      pet2 = create(:pet)
      pet3 = create(:pet)

      application1 = create(:application)
      application2 = create(:application)

      PetApplication.create!(application: application1, pet: pet2)
      PetApplication.create!(application: application2, pet: pet3, approved: 'true')

      visit '/favorites'

      within("#pets_with_applications-#{pet2.id}") do
        expect(page).to have_link("#{pet2.name}")
        click_link("#{pet2.name}")
        expect(current_path).to eq("/pets/#{pet2.id}")
      end

      # visit '/favorites'

      # within("#pets_with_applications-#{pet3.id}") do
      #   expect(page).to have_link("#{pet3.name}")
      #   click_link("#{pet3.name}")
      #   expect(current_path).to eq("/pets/#{pet3.id}")
      # end

      visit '/favorites'

      within("#pets_with_applications") do
        expect(page).to_not have_link("#{pet1.name}")
      end
    end
    it "displays section of pets with approved applications" do

      pet1 = create(:pet)
      pet2 = create(:pet)
      pet3 = create(:pet)

      application1 = create(:application)
      application2 = create(:application)
      application3 = create(:application)

      PetApplication.create!(application: application1, pet: pet1)
      PetApplication.create!(application: application2, pet: pet2)
      PetApplication.create!(application: application3, pet: pet3, approved: "true")

      visit '/favorites'

      within("#pets_with_approved_apps-#{pet3.id}") do
        expect(page).to have_link("#{pet3.name}")
        click_link("#{pet3.name}")
        expect(current_path).to eq("/pets/#{pet3.id}")
      end

      visit '/favorites'

      within("#pets_with_approved_apps") do
        expect(page).to_not have_link("#{pet1.name}")
      end

      within("#pets_with_approved_apps") do
        expect(page).to_not have_link("#{pet2.name}")
      end
    end
  end
end

# User Story 37, List of Pets with Approved Applications

# As a visitor
# After an application has been approved for one or more pets
# When I visit the favorites page
# I see a section on the page that has a list of all of the pets 
# that have an approved application on them
# Each pet's name is a link to their show page