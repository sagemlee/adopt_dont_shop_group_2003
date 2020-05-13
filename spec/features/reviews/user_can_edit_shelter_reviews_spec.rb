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

      expect(page).to have_field(:title, :with => review1.title)
      expect(page).to have_field(:rating, :with => review1.rating)
      expect(page).to have_field(:content, :with => review1.content)
      expect(page).to have_field(:img_url, :with => review1.img_url)

      fill_in :title, with: "Great Shelter"
      fill_in :rating, with: 4
      fill_in :content, with: "Blah blah blah blah blah blah"
      fill_in :img_url, with: "www.img.com/1"

      click_button "Submit Updates"
      expect(current_path).to eq("/shelters/#{shelter.id}")

      expect(page).to have_content("Great Shelter")
      expect(page).to have_content("Blah blah blah blah blah blah")
    end

    it "Shows flash message if fields are missing when submitting on edit page" do
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
      fill_in :content, with: nil
      fill_in :img_url, with: "www.img.com/1"

      click_button "Submit Updates"

      expect(page).to have_content("Please fill out the title, rating and content to submit a review")
      expect(current_path).to eq("/shelters/#{shelter.id}/reviews/#{review1.id}")

      fill_in :title, with: "Great Shelter"
      fill_in :rating, with: 4
      fill_in :content, with: "Something something something something"
      fill_in :img_url, with: "www.img.com/1"

      expect(current_path).to eq("/shelters/#{shelter.id}/reviews/#{review1.id}")

      click_button "Submit Updates"

      expect(page).to have_content("Great Shelter")
      expect(page).to have_content("Something something something something")
    end
  end
end
