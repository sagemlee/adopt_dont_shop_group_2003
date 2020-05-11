require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should belong_to :shelter }
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
  end 
end
