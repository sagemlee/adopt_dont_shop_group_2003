require 'rails_helper'

describe "user deletes review" do
  describe "they visit /shelters/:shelter_id, click link to delete review" do
    it "no longer sees shelter review" do
      shelter = create(:shelter)

      review1 = create(:review, shelter_id: "#{shelter.id}")
      review2 = create(:review, shelter_id: "#{shelter.id}")

      visit "/shelters/#{shelter.id}"

      within(".review-#{review1.id}")do
        click_link "Delete Review"
      end

      expect(current_path).to eq("/shelters/#{shelter.id}")

      expect(page).to_not have_css(".review-#{review1.id}")
    
    end
  end
end
