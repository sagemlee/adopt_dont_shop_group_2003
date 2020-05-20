require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should have_many :pets }
    it { should have_many :reviews }
  end
  describe "methods" do
    it "three_highest_rated" do
      
      shelter1 = create(:shelter)
      shelter2 = create(:shelter)
      shelter3 = create(:shelter)
      shelter4 = create(:shelter)
      shelter5 = create(:shelter)

      review1 = create(:review, rating: "10", shelter_id: "#{shelter1.id}")
      review2 = create(:review, rating: "9", shelter_id: "#{shelter1.id}")
      review3 = create(:review, rating: "8", shelter_id: "#{shelter2.id}")
      review4 = create(:review, rating: "7", shelter_id: "#{shelter2.id}")
      review5 = create(:review, rating: "6", shelter_id: "#{shelter3.id}")
      review6 = create(:review, rating: "5", shelter_id: "#{shelter3.id}")
      review7 = create(:review, rating: "4", shelter_id: "#{shelter4.id}")
      review8 = create(:review, rating: "3", shelter_id: "#{shelter4.id}")
      review9 = create(:review, rating: "2", shelter_id: "#{shelter5.id}")
      review10 = create(:review, rating: "1", shelter_id: "#{shelter5.id}")

      shelters = Shelter.all

      expect(shelters.three_highest_rated).to eq([shelter1, shelter2, shelter3])
    end
  end
end
