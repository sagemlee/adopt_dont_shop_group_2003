require 'rails_helper'

describe "user sees one shelter" do
  describe "they visit /shelters/:id" do
    it "displays information for one shelter" do

      shelter = create(:shelter)

      visit "/shelters/#{shelter.id}"

      expect(page).to have_content(shelter.name)
      expect(page).to have_content(shelter.address)
      expect(page).to have_content(shelter.city)
      expect(page).to have_content(shelter.state)
      expect(page).to have_content(shelter.zip)
      expect(page).to have_link("Update Shelter")
      expect(page).to have_button("Delete Shelter")
    end
  end
end
