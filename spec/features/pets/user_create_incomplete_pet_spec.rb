require 'rails_helper'

describe "user creates pet with incomplete information" do
  it "sees flash message with fields they've missed" do

    shelter = create(:shelter)

    visit "/shelters/#{shelter.id}/pets"
    click_link "Create Pet"

    fill_in :name, with: "Rupert"
    fill_in :img_url, with: "www.img.com/2"
    fill_in :age, with: 10
    fill_in :sex, with: "male"
    # fill_in :description, with: "alright"
    click_on "Create Pet"

    expect(page).to have_content("Description can't be blank")

  end
end

describe "user updates pet with incomplete information" do
  it "sees flash message with fields they've missed" do

    pet = create(:pet)

    visit "/pets/#{pet.id}"
    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{pet.id}/edit")

    fill_in :name, with: "Update name"
    fill_in :img_url, with: "www.img.com/2"
    # fill_in :age, with: 10
    fill_in :sex, with: "female"
    fill_in :description, with: "really cute"
    click_on "Update Pet"
    expect(page).to have_content("Age can't be blank")

  end
end
