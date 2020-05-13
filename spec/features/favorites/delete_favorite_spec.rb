require 'rails_helper'

describe "After a user adds a favorite pet" do
  it "displays a remove pet button instead of add favorite pet button" do

    pet1 = create(:pet)

    visit "/pets/#{pet1.id}" 

    within("#pet-#{pet1.id}") do
      click_button "Add Pet to Favorites"
    end

    expect(page).to have_button('Remove Pet from Favorites')
  end 
end 

describe "After a user clicks to remove pet from favorites" do
  it "deletes the pet from favorites" do

    pet1 = create(:pet)

    visit "/pets/#{pet1.id}" 

    within("#pet-#{pet1.id}") do
      click_button "Add Pet to Favorites"
    end
     
    within("#pet-#{pet1.id}") do
      click_button "Remove Pet from Favorites"
    end

    expect(page).to have_button('Add Pet to Favorites')
    expect(page).to have_content("Favorite Pets: 0")
  end 
end
