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

# User Story 10, Favorite Index Page

# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites index page ("/favorites")
# I see all pets I've favorited
# Each pet in my favorites shows the following information:
# - pet's name (link to pets show page)
# - pet's image