require 'rails_helper'

describe "user updates a shelter" do
  describe "they link from the shelter show page" do
    describe "they fill in new shelter attributes" do
      it "updates the shelter" do

        shelter = create(:shelter)

        visit "shelters/#{shelter.id}"
        click_link "Update Shelter"

        expect(current_path).to eq("/shelters/#{shelter.id}/edit")

        fill_in :name, with: "test1"
        fill_in :address, with: "test1"
        fill_in :city, with: "test1"
        fill_in :state, with: "test1"
        fill_in :zip, with: "test1"

        click_button "Submit"

        expect(current_path).to eq("/shelters/#{shelter.id}")

        expect(page).to have_content("test1")
        expect(page).to have_content("test1")
        expect(page).to have_content("test1")
        expect(page).to have_content("test1")
        expect(page).to have_content("test1")
      end
        it "displays flash message if missing content" do

        shelter = create(:shelter)

        visit "shelters/#{shelter.id}"
        click_link "Update Shelter"

        fill_in :name, with: "test1"
        fill_in :address, with: "test1"
        fill_in :city, with: "test1"
        fill_in :state, with: "test1"
        #missing zip

        click_button "Submit"

        expect(page).to have_content("Please fill out all fields to update the shelter")
        expect(current_path).to eq("/shelters/#{shelter.id}/edit")

        fill_in :name, with: "test1"
        fill_in :address, with: "test1"
        fill_in :city, with: "test1"
        fill_in :state, with: "test1"
        fill_in :zip, with: "test1"

        click_button "Submit"

        expect(current_path).to eq("/shelters/#{shelter.id}")

        expect(page).to have_content("test1")
      end
    end
  end
end
