require 'rails_helper'

describe "user sees all shelters" do
  describe "they visit /shelters" do
    it "displays all shelters" do

      shelter1 = create(:shelter)
      shelter2 = create(:shelter)

      visit "/shelters"
      
      within("#shelter-#{shelter1.id}") do
        expect(page).to have_content(shelter1.name)
      end
      
      within("#shelter-#{shelter2.id}") do
        expect(page).to have_content(shelter2.name)
      end

      expect(page).to have_link("New Shelter")
    end
    it "displays the top 3 highest rated shelters" do

      shelter1 = create(:shelter)
      shelter2 = create(:shelter)
      shelter3 = create(:shelter)
      shelter4 = create(:shelter)
      shelter5 = create(:shelter)

      review1 = create(:review, rating: "10", shelter_id: "#{shelter1.id}")
      review2 = create(:review, rating: "8", shelter_id: "#{shelter2.id}")
      review3 = create(:review, rating: "4", shelter_id: "#{shelter3.id}")
      review4 = create(:review, rating: "2", shelter_id: "#{shelter4.id}")
      review5 = create(:review, rating: "1", shelter_id: "#{shelter5.id}")

      visit "/shelters"

      within("#shelter-stats") do
        expect(page).to have_link("#{shelter1.name}", :href=>"/shelters/#{shelter1.id}")
        expect(page).to have_link("#{shelter2.name}", :href=>"/shelters/#{shelter2.id}")
        expect(page).to have_link("#{shelter3.name}", :href=>"/shelters/#{shelter3.id}")
        expect(page).to_not have_link("#{shelter4.name}", :href=>"/shelters/#{shelter4.id}")
        expect(page).to_not have_link("#{shelter5.name}", :href=>"/shelters/#{shelter5.id}")
      end
    end
  end
end