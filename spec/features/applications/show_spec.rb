require 'rails_helper'

describe "application show page" do
  describe "user visits /applications/:application_id" do
    before(:each) do
    @pet1 = create(:pet)
    @pet2 = create(:pet)

    @application1 = create(:application)

    PetApplication.create!(application: @application1, pet: @pet1)
    PetApplication.create!(application: @application1, pet: @pet2)

      visit "/applications/#{@application1.id}"
    end

    it "displays the applicaton information, the pets the application is for, and an approval link for each" do

      expect(page).to have_content(@application1.name)
      expect(page).to have_content(@application1.address)
      expect(page).to have_content(@application1.city)
      expect(page).to have_content(@application1.state)
      expect(page).to have_content(@application1.zipcode)
      expect(page).to have_content(@application1.phone_number)
      expect(page).to have_content(@application1.description)

      have_link("#{@pet1.name}", :href => "/pets/#{@pet1.id}")
      have_link("#{@pet2.name}", :href => "/pets/#{@pet2.id}")

      within("#pet-#{@pet1.id}") do
        expect(page).to have_content("Approve Application for Pet")
      end

      within("#pet-#{@pet2.id}") do
        expect(page).to have_content("Approve Application for Pet")
      end
    end

    it "does not display approval link for a pet whom already has an approval" do
      application2 = create(:application)
      PetApplication.create!(application: application2, pet: @pet1)

      within("#pet-#{@pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{application2.id}"

      within("#pet-#{@pet1.id}") do
        expect(page).to_not have_link("Approve Application for Pet")
      end
    end

    it "shows link to unapprove previously approved pets" do

      within("#pet-#{@pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{@application1.id}"

      within("#pet-#{@pet1.id}") do
        expect(page).to_not have_link("Approve Application for Pet")
        click_link("Unapprove Application for Pet")
      end

      expect(current_path).to eq("/applications/#{@application1.id}")

      within("#pet-#{@pet1.id}") do
        expect(page).to have_link("Approve Application for Pet")
        expect(page).to_not have_link("Unapprove Application for Pet")
      end

      visit "/pets/#{@pet1.id}"
      expect(page).to have_content("adoptable")
      expect(page).to_not have_content("On hold for #{@application1.name}")
    end
  end
end
