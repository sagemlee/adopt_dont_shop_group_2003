require 'rails_helper'
describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :rating}
    it { should validate_presence_of :content}
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
  end
end
