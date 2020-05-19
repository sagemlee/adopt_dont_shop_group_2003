require 'rails_helper'

describe "user sees any applicant name" do
  describe "user can click the applicant name" do
    it "will be directed to application show page" do

      shelter1 = create(:shelter)
      pet1 = create(:pet, shelter_id:"#{shelter1.id}")
      application = create(:application)
      PetApplication.create!(application: application, pet: pet1, approved: "true")

      visit "/pets/#{pet1.id}"
      expect(page).to have_link("#{application.name}")
    end
  end
end
