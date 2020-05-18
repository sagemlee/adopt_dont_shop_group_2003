require 'rails_helper'

describe "user deletes pet that had been favorited" do
    it "will not see pet in favorites" do

      pet1 = create(:pet)
      pet2 = create(:pet)

      visit "/pets/#{pet1.id}"
      click_button "Add Pet to Favorites"

      visit "/pets/#{pet2.id}"
      click_button "Add Pet to Favorites"

      visit "/pets/#{pet2.id}"

      click_button "Delete Pet"

      visit "/favorites"
      expect(page).to have_css("#pet-#{pet1.id}")
      expect(page).to_not have_css("#pet-#{pet2.id}")
    end
end
