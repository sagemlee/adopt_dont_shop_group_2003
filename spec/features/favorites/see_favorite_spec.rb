require 'rails_helper'

describe "user sees all favorites" do
  describe "they visit /favorites" do
    it "displays all favorite pets" do
      
      pet1 = create(:pet)
      pet2 = create(:pet)

      visit "/pets/#{pet1.id}"

      click_button "Add Pet to Favorites"

      visit "/pets/#{pet2.id}"

      click_button "Add Pet to Favorites"

      visit "/favorites/"

      expect(page).to have_content(pet1.name)
      expect(page).to have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
      expect(page).to have_content(pet2.name)
      expect(page).to have_xpath("//img[@src = '#{pet2.img_url}' and @alt= '#{pet2.id}']")
    end
  end
end

describe "user visits favorites page" do
  describe "user has no favorite pets" do
    it "displays text saying user has no favorite pets" do
      
      visit "/favorites/"

      expect(page).to have_content("You have no favorited pets")
    end
  end
end