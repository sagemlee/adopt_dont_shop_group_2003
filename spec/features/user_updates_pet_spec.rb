require 'rails_helper'

describe "user updates a pet" do
  describe "they link from the pet show page" do
    describe "they fill in new pet info" do
      it "updates the pet" do

        pet = create(:pet)

        visit "pets/#{pet.id}"
        click_link "Update Pet"

        expect(current_path).to eq("/pets/#{pet.id}/edit")

        fill_in :name, with: "Update name"
        fill_in :img_url, with: "www.img.com/2"
        fill_in :age, with: 10
        fill_in :sex, with: "female"
        fill_in :description, with: "really cute"
        click_on "Update Pet"

        expect(current_path).to eq("/pets/#{pet.id}")

        expect(page).to have_content("Update name")
        # expect(page).to have_xpath("//img[@src = www.img and @alt= '#{pet.id}']")
        expect(page).to have_content(10)
        expect(page).to have_content("female")
        expect(page).to have_content("really cute")
      end
    end
  end
end
