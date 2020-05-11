require 'rails_helper'

describe "user creates a new pet" do
  describe "they link from the shelters_pet index" do
    describe "they fill in all pet attributes" do
      it "creates a new pet" do

        shelter = create(:shelter)
        pet1 = create(:pet, shelter_id: "#{shelter.id}")

        visit "/shelters/#{shelter.id}/pets"

        click_link "Create Pet"

        expect(current_path).to eq("/shelters/#{shelter.id}/pets/new")

        fill_in :name, with: "name"
        fill_in :img_url, with: "www.img.com/1"
        fill_in :age, with: 2
        fill_in :sex, with: "male"
        fill_in :description, with: "cute"

        click_button "Create Pet"

        new_pet = Pet.last

        expect(current_path).to eq("/shelters/#{shelter.id}/pets")

        expect(new_pet.name).to eq("name")
        expect(new_pet.img_url).to eq("www.img.com/1")
        expect(new_pet.age).to eq(2)
        expect(new_pet.sex).to eq("male")
        expect(new_pet.description).to eq("cute")
        expect(new_pet.adoption_status).to eq("adoptable")
      end
    end
  end
end
