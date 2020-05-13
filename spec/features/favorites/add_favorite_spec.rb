require 'rails_helper'

describe "When a user adds a favorite" do
  xit "displays a message" do

    pet = create(:pet)

    visit "/pets/#{pet.id}"

    within("#pet-#{pet.id}") do
      click_button "Add Pet to Favorites"
    end

    expect(page).to have_content("#{pet.name} has been added to your favorites.")
  end
  xit "displays the total number of pets in favorites" do

    pet1 = create(:pet)
    pet2 = create(:pet)
    pet3 = create(:pet)

    visit "/pets/#{pet1.id}"

    click_button "Add Pet to Favorites"

    expect(page).to have_content("Favorited Pets: 1")

    visit "/pets/#{pet2.id}"

    click_button "Add Pet to Favorites"

    expect(page).to have_content("Favorited Pets: 2")

    visit "/pets/#{pet3.id}"

    click_button "Add Pet to Favorites"

    expect(page).to have_content("Favorited Pets: 3")
  end
end
