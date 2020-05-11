require 'rails_helper'

describe "user sees all adoptable pets per shelter" do
  describe "they visit /shelters/id/pets" do
    it "displays all adoptable pets" do

      shelter = create(:shelter)
      pet1 = create(:pet, shelter_id: "#{shelter.id}", adoption_status: "pending")
      pet2 = create(:pet, shelter_id: "#{shelter.id}")
      pet3 = create(:pet, shelter_id: "#{shelter.id}")

      visit "/shelters/#{shelter.id}/pets"

      # expect(page).to_not have_content(pet1.name)
      # expect(page).to_not have_content(pet1.age)
      # expect(page).to_not have_content(pet1.sex)
      # expect(page).to_not have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")

      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_xpath("//img[@src = '#{pet2.img_url}' and @alt= '#{pet2.id}']")

      expect(page).to have_content(pet3.name)
      expect(page).to have_content(pet3.age)
      expect(page).to have_content(pet3.sex)
      expect(page).to have_xpath("//img[@src = '#{pet3.img_url}' and @alt= '#{pet3.id}']")

      expect(page).to have_content("Create Pet")
    end
  end
end
