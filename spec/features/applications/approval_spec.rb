require 'rails_helper'

describe "Approving an Application" do
  describe "user clicks link to approve a pet and is taken to the pets show page" do
    before(:each) do
      @pet1 = create(:pet)
      @pet2 = create(:pet)
      @application1 = create(:application)
      PetApplication.create!(application: @application1, pet: @pet1)
      PetApplication.create!(application: @application1, pet: @pet2)

      visit "/applications/#{@application1.id}"
    end

    it "sees status for pet as pending and that the pet is on hold" do

      within("#pet-#{@pet1.id}") do
        click_link "Approve Application for Pet"
      end

      expect(current_path).to eq("/pets/#{@pet1.id}")
      expect(page).to have_content("pending")
      expect(page).to have_content("On hold for #{@application1.name}")

      visit "/pets/#{@pet2.id}"
      expect(page).to_not have_content("On hold for #{@application1.name}")
    end

    it "can approve multiple pets" do

      within("#pet-#{@pet1.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/applications/#{@application1.id}"

      within("#pet-#{@pet2.id}") do
        click_link "Approve Application for Pet"
      end

      visit "/pets/#{@pet1.id}"
      expect(page).to have_content("pending")
      visit "/pets/#{@pet2.id}"
      expect(page).to have_content("pending")
    end
  end
end
