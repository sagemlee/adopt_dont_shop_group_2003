require 'rails_helper'

describe "user deletes pet that had been favorited" do
    it "will not see pet in favorites" do

      pet1 = create(:pet)
      pet2 = create(:pet)

      visit "/pets/#{pet1.id}"
      click "Add Pet to Favorites"

      visit "/pets/#{pet2.id}"
      click "Add Pet to Favorites"

      visit "pets/"

      within("#pet-#{pet1.id}") do
        click "Delete Pet"
      end

      visit "/favorites"
      expect(page).to_not have_css("#pet-#{pet1.id}")

      visit "/pets/#{pet2.id}"

      click "Delete Pet"

      visit "/favorites"
      expect(page).to_not have_css("#pet-#{pet2.id}")
    end
end
