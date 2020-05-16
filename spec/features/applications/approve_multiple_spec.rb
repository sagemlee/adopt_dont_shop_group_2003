require 'rails_helper'

describe "user creates application for more than one pet" do
  describe "visits application show page" do
    xit "can approve any number of pets" do
      pet1 = create(:pet)
      pet2 = create(:pet)

      application1 = create(:application)

      PetApplication.create!(application: application1, pet: pet1)
      PetApplication.create!(application: application1, pet: pet2)

      visit "/applications/#{application1.id}"

      within("#pet-#{pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{application1.id}"

      within("#pet-#{pet2.id}") do
        click_link "Approve Application for Pet"
      end
      binding.pry
      expect(pet1.id.applications.approved_application).to eq(application1)
      expect(pet2.id.applications.approved_application).to eq(application1)

    end
  end
end
