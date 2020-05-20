require 'rails_helper'
describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :rating}
    it { should validate_presence_of :content}
    it { should validate_inclusion_of(:rating).in_range(1..10).with_message("You've entered an invalid rating, please choose a number between 1 & 10")}
end
  describe "relationships" do
    it { should belong_to :shelter }
  end
  describe "methods" do
    it "average_rating" do

    shelter1 = create(:shelter)

    review1 = create(:review, shelter_id: "#{shelter1.id}", rating: "5")
    review2 = create(:review, shelter_id: "#{shelter1.id}", rating: "5")
    review2 = create(:review, shelter_id: "#{shelter1.id}", rating: "2")

    reviews = Review.all

    expect(reviews.average_rating).to eq(4)
    end
    it "highest_desc" do

    shelter1 = create(:shelter)

    review1 = create(:review, shelter_id: "#{shelter1.id}", rating: "5")
    review2 = create(:review, shelter_id: "#{shelter1.id}", rating: "4")
    review3 = create(:review, shelter_id: "#{shelter1.id}", rating: "3")
    review4 = create(:review, shelter_id: "#{shelter1.id}", rating: "2")

    reviews = Review.all

    expect(reviews.highest_desc).to eq([review4, review3, review2, review1])
    end
    it "lowest_asc" do

    shelter1 = create(:shelter)

    review1 = create(:review, shelter_id: "#{shelter1.id}", rating: "5")
    review2 = create(:review, shelter_id: "#{shelter1.id}", rating: "4")
    review3 = create(:review, shelter_id: "#{shelter1.id}", rating: "3")
    review4 = create(:review, shelter_id: "#{shelter1.id}", rating: "2")

    reviews = Review.all

    expect(reviews.lowest_asc).to eq([review1, review2, review3, review4])
    end
  end
end
