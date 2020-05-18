require 'rails_helper'

describe "user creates or updates pet with incomplete information" do
    it "sees flash message with fields they've missed" do

      shelter = create(:shelter)

      visit "/shelters/#{shelter.id}"
      click_link "Create Pet"

      fill_in :name, with: "Rupert"
      fill_in :img_url, with: "www.img.com/2"
      fill_in :age, with: 10
      fill_in :sex, with: "male"
      fill_in :description, with: "alright"
      click_on "Create Pet"

      visit "pets/#{pet.id}"
      click_link "Update Pet"

      expect(current_path).to eq("/pets/#{pet.id}/edit")

      fill_in :name, with: "Update name"
      fill_in :img_url, with: "www.img.com/2"
      fill_in :age, with: 10
      fill_in :sex, with: "female"
      fill_in :description, with: "really cute"
      click_on "Update Pet"
    end
end
