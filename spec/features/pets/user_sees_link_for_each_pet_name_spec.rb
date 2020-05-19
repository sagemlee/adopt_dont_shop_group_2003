require 'rails_helper'

describe "user sees any pet name" do
  describe "user can click the pet name" do
    it "will be directed to pet show page" do

      shelter1 = create(:shelter)
      shelter2 = create(:shelter)

      pet1 = create(:pet, shelter_id:"#{shelter1.id}")
      pet2 = create(:pet, shelter_id:"#{shelter2.id}")
      pet3 = create(:pet, shelter_id:"#{shelter2.id}")

      application = create(:application)
      PetApplication.create!(application: application, pet: pet1)

      visit "/pets/#{pet1.id}/applications"
      expect(page).to have_link("#{pet1.name}")

    end
  end
end
