require 'rails_helper'

describe "user creates application" do
  describe "visits pet favorites and clicks create application" do
    xit "shows pet application page" do

      pet1 = create(:pet)
      pet2 = create(:pet)
      pet3 = create(:pet)

      visit "/pets/#{pet2.id}"
      within("#pet-#{pet2.id}") do
        click_button "Add Pet to Favorites"
      end

      visit "/pets/#{pet3.id}"
      within("#pet-#{pet3.id}") do
        click_button "Add Pet to Favorites"
      end

      visit '/favorites'
      click_link "Adopt My Favorite Pets"
      expect(current_path).to eq('/applications/new')

      within("#pet-#{pet2.id}") do
        click_button "Select"
      end

      within("#pet-#{pet3.id}") do
        click_button "Select"
      end

      fill_in :name, with: "Bob"
      fill_in :address, with: "Bobsfdwe"
      fill_in :city, with: "Bobagre"
      fill_in :state, with: "Bobsfg"
      fill_in :zip, with: "12345"
      fill_in :description, with: "Bob likes cheese"

      click_button "Submit My Application"

      expect(page).to have_content("Your application has been submitted")
      expect(current_path).to eq('/favorites')
      expect(page).to_not have_css("#pet-#{pet2.id}")
      expect(page).to_not have_css("#pet-#{pet3.id}")
    end
  end
end
