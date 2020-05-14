require 'rails_helper'

describe "user creates application" do
  describe "visits pet favorites and clicks create application" do
    it "shows pet application page" do

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
      
      select("#{pet2.name}")
      select("#{pet3.name}")
      fill_in :name, with: "Bob"
      fill_in :address, with: "Bobsfdwe"
      fill_in :city, with: "Bobagre"
      fill_in :state, with: "Bobsfg"
      fill_in :zip, with: "12345"
      fill_in :description, with: "Bob likes cheese"

      click_button "Submit Application"

      expect(page).to have_content("Your application has been submitted")
      expect(current_path).to eq('/favorites')
      expect(page).to_not have_css("#pet-#{pet2.id}")
      expect(page).to_not have_css("#pet-#{pet3.id}")
    end

    xit "creates application" do
      pet2 = create(:pet)
      pet3 = create(:pet)
      application = Application.new(name: "app 1", address: "add2", city: "city1", state: "state1", zipcode: "80000", phone_number: "111-111-1111", description: "descr1")

      PetApplication.new()

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

      select("#{pet2.name}")
      select("#{pet3.name}")
      fill_in :name, with: "Bob"
      fill_in :address, with: "Bobsfdwe"
      fill_in :city, with: "Bobagre"
      fill_in :state, with: "Bobsfg"
      fill_in :zip, with: "12345"
      fill_in :description, with: "Bob likes cheese"

      click_button "Submit Application"

      new_application = Application.last

      expect(new_application.name).to eq("Bob")
      expect(new_application.address).to eq("Bobsfdwe")
      expect(new_application.city).to eq("Bobagre")
      expect(new_application.state).to eq("Bobsfg")
      expect(new_application.state).to eq("Bob")
      expect(new_application.zip).to eq("Bob")
      expect(new_application.description).to eq("Bob")
    end
  end
end
