require 'rails_helper'

describe "user tries to delete shelter from shelter index that has approved apps on any pet" do
  it "cannot delete shelter" do
    
    shelter1 = create(:shelter)

    pet1 = create(:pet, shelter_id: "#{shelter1.id}", adoption_status: "pending")
    pet2 = create(:pet, shelter_id: "#{shelter1.id}")
    pet3 = create(:pet, shelter_id: "#{shelter1.id}")

    application1 = create(:application)
    application2 = create(:application)
    application3 = create(:application)

    PetApplication.create!(pet: pet1, application: application1, approved: "true")
    PetApplication.create!(pet: pet1, application: application2)
    PetApplication.create!(pet: pet2, application: application3)
    PetApplication.create!(pet: pet3, application: application3)

    visit "/shelters"

    within("#shelter-#{shelter1.id}") do
      expect(page).to_not have_content("Delete Shelter")
    end 
  end
end

describe "user tries to delete shelter from shelter show that has approved apps on any pet" do
  it "cannot delete shelter" do
    
    shelter = create(:shelter)
    pet1 = create(:pet, shelter_id: "#{shelter.id}", adoption_status: "pending")
    pet2 = create(:pet, shelter_id: "#{shelter.id}")
    pet3 = create(:pet, shelter_id: "#{shelter.id}")

    application1 = create(:application)
    application2 = create(:application)
    application3 = create(:application)

    PetApplication.create!(pet: pet1, application: application1, approved: "true")
    PetApplication.create!(pet: pet1, application: application2)
    PetApplication.create!(pet: pet2, application: application3)
    PetApplication.create!(pet: pet3, application: application3)

    visit "/shelters/#{shelter.id}"

    within("#shelter-#{shelter.id}") do
      expect(page).to_not have_content("Delete Shelter")
    end 
  end
end

describe "user deletes shelter that has no pets with approved applications" do
  before(:each) do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
    @pet1 = create(:pet, shelter_id: "#{@shelter1.id}", adoption_status: "pending")
    @pet2 = create(:pet, shelter_id: "#{@shelter1.id}")
    @pet3 = create(:pet, shelter_id: "#{@shelter2.id}", adoption_status: "pending")
    
    @application1 = create(:application)
    @application2 = create(:application)
    @application3 = create(:application)
    
    PetApplication.create!(pet: @pet1, application: @application1)
    PetApplication.create!(pet: @pet1, application: @application2)
    PetApplication.create!(pet: @pet2, application: @application3)
    PetApplication.create!(pet: @pet3, application: @application3)

  end   
  it "deletes all of its pets from shelter show" do

    visit "/shelters/#{@shelter1.id}"
    
    within("#shelter-#{@shelter1.id}") do
      click_button "Delete Shelter"
    end
    
    pets = Pet.all

    expect(pets).to eq([@pet3])
  end
  it "deletes all of its pets from shelter index" do

    visit "/shelters"
    
    within("#shelter-#{@shelter1.id}") do
      click_button "Delete Shelter"
    end
    
    pets = Pet.all

    expect(pets).to eq([@pet3])
  end
end