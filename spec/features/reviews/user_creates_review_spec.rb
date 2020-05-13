require 'rails_helper'

describe "user creates review" do
  describe "they visit /shelters/:id" do
    it "shows link to create a review" do
      shelter = create(:shelter)

      review1 = create(:review, shelter_id: "#{shelter.id}")
      review2 = create(:review, shelter_id: "#{shelter.id}")

      visit "/shelters/#{shelter.id}"

      click_link "New Review"
      expect(current_path).to eq("/shelters/#{shelter.id}/reviews/new")

      fill_in :title, with: "Great Shelter"
      fill_in :rating, with: 4
      fill_in :content, with: "Blah blah blah blah blah blah"
      fill_in :img_url, with: "www.img.com/1"

      click_button "Submit"
      expect(current_path).to eq("/shelters/#{shelter.id}")

      expect(page).to have_content("Great Shelter")
      expect(page).to have_content("Blah blah blah blah blah blah")
    end

    it "displays flash message if missing content" do
      shelter = create(:shelter)

      review1 = create(:review, shelter_id: "#{shelter.id}")
      review2 = create(:review, shelter_id: "#{shelter.id}")

      visit "/shelters/#{shelter.id}"

      click_link "New Review"
      expect(current_path).to eq("/shelters/#{shelter.id}/reviews/new")

      fill_in :content, with: "Something something something something"
      fill_in :img_url, with: "www.img.com/2"

      click_button "Submit"

      expect(page).to have_content("Please fill out the title, rating and content to submit a review")
      expect(current_path).to eq("/shelters/#{shelter.id}/reviews/new")

    end
  end
end
