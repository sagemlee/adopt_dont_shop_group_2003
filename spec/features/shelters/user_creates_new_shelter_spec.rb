require 'rails_helper'

describe "user creates a new shelter" do
  describe "they link from the shelters index" do
    describe "they fill in all shelter attributes" do
      it "creates a new shelter" do

        shelter = create(:shelter)
        
        visit "/shelters/"
        click_link "New Shelter"

        expect(current_path).to eq("/shelters/new")

        fill_in :name, with: "New name"
        fill_in :address, with: "New address"
        fill_in :city, with: "New city"
        fill_in :state, with: "New state"
        fill_in :zip, with: "New zip"
        
        click_on "Create Shelter"

        new_shelter = Shelter.last

        expect(current_path).to eq("/shelters")

        expect(new_shelter.name).to eq("New name")
      end
        it "displays flash message if missing content" do

        shelter = create(:shelter)

        visit "/shelters/new"
        
        fill_in :name, with: "test1"
        fill_in :address, with: "test1"
        fill_in :city, with: "test1"
        fill_in :state, with: "test1"
        #missing zip

        click_button "Create Shelter"

        expect(page).to have_content("Please fill out all fields to create a shelter")
        expect(current_path).to eq("/shelters/new")

        fill_in :name, with: "test1"
        fill_in :address, with: "test1"
        fill_in :city, with: "test1"
        fill_in :state, with: "test1"
        fill_in :zip, with: "test1"

        click_button "Create Shelter"

        expect(current_path).to eq("/shelters")

        expect(page).to have_content("test1")
      end
    end
  end
end
