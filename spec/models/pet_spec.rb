require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :img_url}
    it { should validate_presence_of :age}
    it { should validate_presence_of :sex}
    it { should validate_presence_of :description}
  end
  describe "relationships" do
    it { should belong_to :shelter }
    it { should have_many :pet_applications}
    it { should have_many(:applications).through(:pet_applications)}
  end
  describe "methods" do
    it ".adoptable_pets" do
      pet1 = create(:pet, adoption_status: "pending")
      pet2 = create(:pet)
      pet3 = create(:pet)

      pets = Pet.all

      expect(pets.adoptable_pets).to eq([pet2, pet3])
    end
    it ".count_of_pets" do
      pet1 = create(:pet, adoption_status: "pending")
      pet2 = create(:pet)
      pet3 = create(:pet)

      pets = Pet.all

      expect(pets.count_of_pets).to eq(3)
    end
    it ".count_of_adoptable_pets" do
      pet1 = create(:pet, adoption_status: "pending")
      pet2 = create(:pet)
      pet3 = create(:pet)

      pets = Pet.all

      expect(pets.count_of_adoptable_pets).to eq(2)
    end
    it ".all_pets_by_adoption_status" do
      pet1 = create(:pet, adoption_status: "pending")
      pet2 = create(:pet)
      pet3 = create(:pet)

      pets = Pet.all

      expect(pets.all_pets_by_adoption_status).to eq([pet2, pet3, pet1])
    end
    it "pets_with_approved_apps" do

      shelter = create(:shelter)
      pet1 = create(:pet, shelter_id: "#{shelter.id}")
      pet2 = create(:pet)
      pet3 = create(:pet)

      application1 = create(:application)
      application2 = create(:application)

      pet_application1 = PetApplication.create(pet: pet1, application: application1, approved: 'true')
      pet_application2 = PetApplication.create(pet: pet2, application: application1)
      pet_application2 = PetApplication.create(pet: pet3, application: application2)

      pets = Pet.all

      expect(pets.pets_with_approved_apps).to eq([pet1])
    end
    it "pets_with_unapproved_apps" do

      shelter = create(:shelter)
      pet1 = create(:pet, shelter_id: "#{shelter.id}")
      pet2 = create(:pet)
      pet3 = create(:pet)

      application1 = create(:application)
      application2 = create(:application)

      pet_application1 = PetApplication.create(pet: pet1, application: application1, approved: 'true')
      pet_application2 = PetApplication.create(pet: pet2, application: application1)
      pet_application2 = PetApplication.create(pet: pet3, application: application2)

      pets = Pet.all

      expect(pets.pets_with_unapproved_apps).to eq([pet2, pet3])
    end
    it "pets_with_pending_status" do

      shelter = create(:shelter)
      pet1 = create(:pet, shelter_id: "#{shelter.id}", adoption_status: "pending")
      pet2 = create(:pet, shelter_id: "#{shelter.id}")
      pet3 = create(:pet)
      pet4 = create(:pet, shelter_id: "#{shelter.id}", adoption_status: "pending")

      pets = Pet.all

      expect(pets.pets_with_pending_status).to eq([pet1, pet4])
    end
    it "number_of_apps" do

      shelter = create(:shelter)
      pet1 = create(:pet, shelter_id: "#{shelter.id}")
      pet2 = create(:pet, shelter_id: "#{shelter.id}")
      pet3 = create(:pet, shelter_id: "#{shelter.id}")
      pet4 = create(:pet, shelter_id: "#{shelter.id}")
      pet5 = create(:pet, shelter_id: "#{shelter.id}")

      application1 = create(:application)
      application2 = create(:application)
      application3 = create(:application)
      application4 = create(:application)

      pet_application1 = PetApplication.create(pet: pet1, application: application1, approved: 'true')
      pet_application2 = PetApplication.create(pet: pet2, application: application1)
      pet_application3 = PetApplication.create(pet: pet3, application: application2)
      pet_application4 = PetApplication.create(pet: pet4, application: application3)
      pet_application5 = PetApplication.create(pet: pet4, application: application4)
      pet_application6 = PetApplication.create(pet: pet5, application: application4)

      pets = Pet.all

      expect(pets.number_of_apps).to eq(4)
    end
  end
end
