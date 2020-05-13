require 'rails_helper'

describe "user edits review" do
  describe "they visit /shelters/:id" do
    it "shows link to edit next to each review" do
      shelter = create(:shelter)

      review1 = create(:review, shelter_id: "#{shelter.id}")
      review2 = create(:review, shelter_id: "#{shelter.id}")

      visit "/shelters/#{shelter.id}"

      within(".review-#{review1.id}")do
        click_link "Edit this Review"
      end

      expect(current_path).to eq("/shelters/#{shelter.id}/reviews/#{review1.id}/edit")
      # 
      # expect(page).to have_content(review1.title)
      # expect(page).to have_content(review1.rating)
      # expect(page).to have_content(review1.content)
      # expect(page).to have_content(review1.img_url)

      fill_in :title, with: "Great Shelter"
      fill_in :rating, with: 4
      fill_in :content, with: "Blah blah blah blah blah blah"
      fill_in :img_url, with: "www.img.com/1"

      click_button "Submit Updates"
      expect(current_path).to eq("/shelters/#{shelter.id}")

      expect(page).to have_content("Great Shelter")
      expect(page).to have_content("Blah blah blah blah blah blah")
    end
  end
end
