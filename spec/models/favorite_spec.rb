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
  end
end