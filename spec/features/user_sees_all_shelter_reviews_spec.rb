require 'rails_helper'

describe "user sees all shelter reviews" do
  describe "they visit /shelters/:id" do
    it "displays shelter's reviews" do

      shelter = create(:shelter)

      review1 = create(:review)
      review2 = create(:review)

      visit "/shelters/#{shelter.id}"

      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.rating)
      expect(page).to have_content(review1.content)
      expect(page).to have_content(review1.img_url)

      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.rating)
      expect(page).to have_content(review2.content)
      expect(page).to_not have_content(review2.img_url)
    end
  end
end


# User Story 2, Shelter Reviews
#
# As a visitor,
# When I visit a shelter's show page,
# I see a list of reviews for that shelter
# Each review will have:
# - title
# - rating
# - content
# - an optional picture
