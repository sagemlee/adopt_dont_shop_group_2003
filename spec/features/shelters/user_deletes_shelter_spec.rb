require 'rails_helper'

describe "user deletes a shelter" do
  describe "they link from the shelter index" do
     it "displays all shelters without the deleted entry" do

       shelter1 = create(:shelter)
       shelter2 = create(:shelter)

       visit "/shelters/#{shelter2.id}"
       click_button "Delete Shelter"

       expect(current_path).to eq("/shelters/")

       expect(page).to have_content(shelter1.name)
       expect(page).to_not have_content(shelter2.name)
     end
  end
end
