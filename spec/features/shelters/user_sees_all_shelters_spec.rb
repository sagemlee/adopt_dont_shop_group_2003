require 'rails_helper'

describe "user sees all shelters" do
  describe "they visit /shelters" do
    it "displays all shelters" do

      shelter1 = create(:shelter)
      shelter2 = create(:shelter)

      visit "/shelters/"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
      expect(page).to have_link("New Shelter")
    end
  end
end
