require 'rails_helper'

describe "user sees all favorites" do
  describe "they visit /favorites" do
    xit "displays all favorite pets" do

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
    xit "displays text saying user has no favorite pets" do

      visit "/favorites/"

      expect(page).to have_content("You have no favorite pets")
    end
  end
end

describe "user visits favorites index page" do
  describe "one or more applications have been created" do
    it "displays section of pets with applications" do
      # @pet1 = create(:pet)
      # @pet2 = create(:pet)
      # @pet3 = create(:pet)

      pet1 = create(:pet)
      pet2 = create(:pet)
      pet3 = create(:pet)

      application1 = create(:application)
      application2 = create(:application)

      PetApplication.create!(application: application1, pet: pet2)
      PetApplication.create!(application: application2, pet: pet3)

      # visit "/pets/#{@pet1.id}"
      # within("#pet-#{@pet1.id}") do
      #   click_button "Add Pet to Favorites"
      # end
      #
      # visit "/pets/#{@pet2.id}"
      # within("#pet-#{@pet2.id}") do
      #   click_button "Add Pet to Favorites"
      # end
      #
      # visit "/pets/#{@pet3.id}"
      # within("#pet-#{@pet3.id}") do
      #   click_button "Add Pet to Favorites"
      # end
      #
      # visit '/favorites'
      # click_link "Adopt My Favorite Pets"
      # expect(current_path).to eq('/applications/new')
      #
      # select("#{@pet2.name}")
      # select("#{@pet3.name}")
      # fill_in :name, with: "Bob"
      # fill_in :address, with: "Bobsfdwe"
      # fill_in :city, with: "Bobagre"
      # fill_in :state, with: "Bobsfg"
      # fill_in :zipcode, with: "12345"
      # fill_in :phone_number, with: "111-111-1111"
      # fill_in :description, with: "Bob likes cheese"
      #
      # click_button "Submit Application"
      visit '/favorites'

      within("#pets_with_applications-#{pet2.id}") do
        expect(page).to have_link("#{pet2.name}")
        click_link("#{pet2.name}")
        expect(current_path).to eq("/pets/#{pet2.id}")
      end
      
      within("#pets_with_applications-#{pet3.id}") do
        expect(page).to have_link("#{pet3.name}")
        click_link("#{pet3.name}")
        expect(current_path).to eq("/pets/#{pet3.id}")
      end

      # within("#pets_with_applications-#{pet3.id}") do
      #   expect(page).to have_link("#{pet3.name}")
      #   click_link("#{pet3.name}")
      #   expect(current_path).to eq("/pets/#{pet3.id}")
      # end

      within("#pets_with_applications") do
        expect(page).to_not have_link("#{pet1.name}")
      end

    end
  end
end

# User Story 18, List of Pets that have applications on them
#
# As a visitor
# After one or more applications have been created
# When I visit the favorites index page
# I see a section on the page that has a list of all of the pets that have at least one application on them
# Each pet's name is a link to their show page
