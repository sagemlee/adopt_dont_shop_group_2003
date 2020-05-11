require 'rails_helper'

describe "user deletes a pet" do
  describe "they link from the pet show page" do
     it "displays all pets without the deleted entry" do

       pet1 = create(:pet)
       pet2 = create(:pet)

       visit "/pets/#{pet2.id}"
       click_button "Delete Pet"

       expect(current_path).to eq("/pets/")

       expect(page).to have_content(pet1.name)
       # expect(page).to have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
       expect(page).to have_content(pet1.age)
       expect(page).to have_content(pet1.sex)
       expect(page).to_not have_content(pet2.name)
       # expect(page).to have_xpath("//img[@src = '#{pet1.img_url}' and @alt= '#{pet1.id}']")
     end
  end
end

