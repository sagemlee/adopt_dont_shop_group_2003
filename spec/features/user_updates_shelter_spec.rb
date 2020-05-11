require 'rails_helper'

describe "user updates a shelter" do
  describe "they link from the shelter show page" do
    describe "they fill in new shelter attributes" do
      it "updates the shelter" do

        shelter = create(:shelter)

        visit "shelters/#{shelter.id}"
        click_link "Update Shelter"

        expect(current_path).to eq("/shelters/#{shelter.id}/edit")

        fill_in "shelter[name]", with: "Update name"
        fill_in "shelter[address]", with: "Update address"
        fill_in "shelter[city]", with: "Update city"
        fill_in "shelter[state]", with: "Update state"
        fill_in "shelter[zip]", with: "Update zip"
        click_on "Submit"

        expect(current_path).to eq("/shelters/#{shelter.id}")

        expect(page).to have_content("Update name")
        expect(page).to have_content("Update address")
        expect(page).to have_content("Update city")
        expect(page).to have_content("Update state")
        expect(page).to have_content("Update zip")
      end
    end
  end
end
