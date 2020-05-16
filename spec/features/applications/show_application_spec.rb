require 'rails_helper'

describe "user sees one application" do
  describe "they visit /applications/:application_id" do
    it "displays the application and the pets it is applying for" do

    #   shelter1 = Shelter.create(name: "Denver Animal Shelter", address: "123 Imaginary Dr.", city: "Denver", state: "CO", zip: "80203")
    #   pet1 = shelter1.pets.create(name: "Fluffy", age: 1, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog1.jpg", adoption_status: "adoptable", description: "cute and fluffy")
    #   pet2 = shelter1.pets.create(name: "Fido", age: 1, sex: "male", img_url: "https://adoptdontshop.s3-us-west-1.amazonaws.com/dog1.jpg", adoption_status: "adoptable", description: "cute and fluffy")

      pet1 = create(:pet)
      pet2 = create(:pet)
        
      application1 = Application.new(name: "App 1", address: "Add 1", city: "City 1", state: "State 1", zipcode: "80001", phone_number: "111-111-1111", description: "Descr 1", approval_status: "false")

      PetApplication.create!(application: application1, pet: pet1) 
      PetApplication.create!(application: application1, pet: pet2) 

      visit "/applications/#{application1.id}"


      expect(page).to have_content(application1.name)
      expect(page).to have_content(application1.address)
      expect(page).to have_content(application1.city)
      expect(page).to have_content(application1.state)
      expect(page).to have_content(application1.zip)
      expect(page).to have_content(application1.phone_number)
      expect(page).to have_content(application1.description)
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
      expect(page).to have_link("/pets/#{pet1.id}")
      expect(page).to have_link("/pets/#{pet2.id}")
    end
  end
end

# User Story 19, Application Show Page

# As a visitor
# When I visit an applications show page "/applications/:id"
# I can see the following:
# - name
# - address
# - city
# - state
# - zip
# - phone number
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pet's that this application is for (all names of pets should be links to their show page)