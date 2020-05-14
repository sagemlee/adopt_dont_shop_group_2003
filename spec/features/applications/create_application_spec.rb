require 'rails_helper'

describe "user creates application" do
  describe "visits pet favorites and clicks create application" do
    before(:each) do
      @pet1 = create(:pet)
      @pet2 = create(:pet)
      @pet3 = create(:pet)

      visit "/pets/#{@pet2.id}"
      within("#pet-#{@pet2.id}") do
        click_button "Add Pet to Favorites"
      end

      visit "/pets/#{@pet3.id}"
      within("#pet-#{@pet3.id}") do
        click_button "Add Pet to Favorites"
      end

      visit '/favorites'
      click_link "Adopt My Favorite Pets"
      expect(current_path).to eq('/applications/new')
      
      select("#{@pet2.name}")
      select("#{@pet3.name}")
      fill_in :name, with: "Bob"
      fill_in :address, with: "Bobsfdwe"
      fill_in :city, with: "Bobagre"
      fill_in :state, with: "Bobsfg"
      fill_in :zipcode, with: "12345"
      fill_in :phone_number, with: "111-111-1111"
      fill_in :description, with: "Bob likes cheese"

      click_button "Submit Application"
    end 
    it "shows pet application page" do

      expect(page).to have_content("Your application has been submitted")
      expect(current_path).to eq('/favorites')
      expect(page).to_not have_css("#pet-#{@pet2.id}")
      expect(page).to_not have_css("#pet-#{@pet3.id}")
    end

    it "creates application" do

      new_application = Application.last

      expect(new_application.name).to eq("Bob")
      expect(new_application.address).to eq("Bobsfdwe")
      expect(new_application.city).to eq("Bobagre")
      expect(new_application.state).to eq("Bobsfg")
      expect(new_application.zipcode).to eq("12345")
      expect(new_application.description).to eq("Bob likes cheese")
      expect(new_application.approval_status).to eq("false")
    end
  end
  describe "user does not fill out all information" do
    it "displays a flash message and redirects user back to new application page" do
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
      fill_in :zipcode, with: "12345"
      fill_in :description, with: "Bob likes cheese"

      click_button "Submit Application"
    end 
  end 
end
