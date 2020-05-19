require 'rails_helper'

describe "user tries to delete pet, that has an approved application" do
  it "on pets index page will not see delete button" do

    pet1 = create(:pet)
    pet2 = create(:pet)

    application1 = create(:application)

    PetApplication.create!(application: application1, pet: pet1)
    PetApplication.create!(application: application1, pet: pet2)

    visit "/applications/#{application1.id}"

    within("#pet-#{pet2.id}") do
      click_link "Approve Application for Pet"
    end

    visit '/pets'

    within("#pet-#{pet2.id}") do
      expect(page).to_not have_button("Delete Pet")
    end

    visit "/pets/#{pet2.id}"
    expect(page).to_not have_button("Delete Pet")
  end

  it "on shelter pets index page will not see delete button" do

    shelter1 = create(:shelter)

    pet1 = create(:pet, shelter: shelter1)
    pet2 = create(:pet, shelter: shelter1)

    application1 = create(:application)

    PetApplication.create!(application: application1, pet: pet1)
    PetApplication.create!(application: application1, pet: pet2)

    visit "/applications/#{application1.id}"

    within("#pet-#{pet1.id}") do
      click_link "Approve Application for Pet"
    end

    visit "/shelters/#{shelter1.id}/pets"

    within("#pet-#{pet1.id}") do
      expect(page).to_not have_button("Delete Pet")
    end

    within("#pet-#{pet2.id}") do
      expect(page).to have_button("Delete Pet")
    end

  end
end
