require 'rails_helper'

describe Favorite do
  subject { Favorite.new({"1" => 2, '2' => 3})}

  describe "total_count" do
    it "can calculate the total number of items it holds" do

      expect(subject.total_count).to eq(5)
    end
  end 

  describe "add_favorite" do
    it "adds a favorite to its contents" do
      favorite = Favorite.new({
        '1' => 2,
        '2' => 3
      })

      subject.add_pet(1)
      subject.add_pet(2)

      expect(subject.contents).to eq({'1' => 3, '2' => 4})
    end
    
    it "adds a pet that hasnt' been added yet" do
      subject.add_pet('3')

      expect(subject.contents).to eq({'1' => 2, '2' => 3, '3' => 1})
    end
  end

  describe "count_of" do
    it "returns the count of all pets in favorites" do
      favorite = Favorite.new({})

      expect(favorite.count_of(5)).to eq(0)
    end
  end
end