require 'rails_helper'

describe PetApplication, type: :model do
  describe "relationships" do
      it { should belong_to :pet}
      it { should belong_to :application}
  end

  describe "methods" do
    it "approved_application" do
      pet1 = create(:pet)
      pet2 = create(:pet)

      application1 = create(:application)

      pet_application1 = PetApplication.create(pet: pet1, application: application1, approved: "true")
      pet_application2 = PetApplication.create(pet: pet2, application: application1)

      pet_applications = PetApplication.all

      expect(pet_applications.approved_application).to eq(pet_application1)
    end
  end

end
