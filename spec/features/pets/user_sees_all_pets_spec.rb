require 'rails_helper'

describe "user sees all pets" do
  describe "they visit /pets" do
    it "displays all pets" do

      pet1 = create(:pet)
      pet2 = create(:pet)

      visit "/pets/"

      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
      expect(page).to have_content(pet1.shelter.name)

      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_xpath("//img[@src = '#{pet2.img_url}' and @alt= '#{pet2.id}']")
      expect(page).to have_content(pet2.shelter.name)
    end
  end
end
