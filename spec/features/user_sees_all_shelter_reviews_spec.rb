require 'rails_helper'

describe "user sees all shelter reviews" do
  describe "they visit /shelters/:id" do
    it "displays shelter's reviews" do

      shelter = create(:shelter)

      review1 = create(:review, shelter_id: "#{shelter.id}")
      review2 = create(:review, shelter_id: "#{shelter.id}")

      visit "/shelters/#{shelter.id}"

      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.rating)
      expect(page).to have_content(review1.content)
      expect(page).to have_xpath("//img[@src = '#{review1.img_url}' and @alt= '#{review1.id}']")


      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.rating)
      expect(page).to have_content(review2.content)
      expect(page).to have_xpath("//img[@src = '#{review2.img_url}' and @alt= '#{review2.id}']")

    end
  end
end
