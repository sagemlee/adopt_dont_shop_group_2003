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

describe "After a user adds a favorite pet and visits the favorites page" do
  describe "they click a link to remove the pet from favorites" do
    it "removes pet from favorites" do
      
      pet1 = create(:pet)

      visit "/pets/#{pet1.id}" 
      
      within("#pet-#{pet1.id}") do
        click_button "Add Pet to Favorites"
      end
    
      visit "/favorites/"

      within("#pet-#{pet1.id}") do
        click_button "Remove Pet from Favorites"
      end 

      visit "/favorites/"

      expect(page).to_not have_content(pet1.name)
      expect(page).to_not have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
      expect(page).to have_content("Favorite Pets: 0")
    end
  end
end

describe "When a user visits the favorites page and clicks remove all favorited pets" do
  it "delete all favorited pets" do
    
    pet1 = create(:pet)
    pet2 = create(:pet)

    visit "/pets/#{pet1.id}" 
    
    within("#pet-#{pet1.id}") do
      click_button "Add Pet to Favorites"
    end

    visit "/pets/#{pet2.id}" 
    
    within("#pet-#{pet2.id}") do
      click_button "Add Pet to Favorites"
    end

    visit "/favorites/"

    click_link "Remove all favorite pets"

    expect(page).to have_content("You have no favorite pets")
    expect(page).to have_content("Favorite Pets: 0")
  end
end