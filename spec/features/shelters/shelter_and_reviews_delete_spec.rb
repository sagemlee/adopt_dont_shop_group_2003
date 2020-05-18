require 'rails_helper'

describe "user deletes shelter from shelter show page" do
  it "deletes all reviews for that shelter" do
    shelter1 = create(:shelter)
    shelter2 = create(:shelter)

    review1 = create(:review, shelter_id: "#{shelter1.id}")
    review2 = create(:review, shelter_id: "#{shelter1.id}")
    review3 = create(:review, shelter_id: "#{shelter2.id}")
    review4 = create(:review, shelter_id: "#{shelter2.id}")

    visit "/shelters/#{shelter1.id}"

    within("#shelter-#{shelter1.id}")do
      click_button "Delete Shelter"
    end

    reviews = Review.all

    expect(reviews).to eq([review3, review4])
  end
end

describe "user deletes shelter from shelter index page" do
  it "deletes all reviews for that shelter" do
    shelter1 = create(:shelter)
    shelter2 = create(:shelter)

    review1 = create(:review, shelter_id: "#{shelter1.id}")
    review2 = create(:review, shelter_id: "#{shelter1.id}")
    review3 = create(:review, shelter_id: "#{shelter2.id}")
    review4 = create(:review, shelter_id: "#{shelter2.id}")

    visit "/shelters"

    within("#shelter-#{shelter1.id}")do
      click_button "Delete Shelter"
    end

    reviews = Review.all

    expect(reviews).to eq([review3, review4])
  end
end