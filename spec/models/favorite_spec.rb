require 'rails_helper'

Rspec.describe Favorite do
  subject { Favorite.new({"1" => 2, '2' => 3})}

  describe "total_count" do
    it "can calculate the total number of items it holds" do

      expect(subject.total_count).to eq(5)
    end
  end 

  describe "add_favorite" do
    it "adds a favorite to its contents" do
      
      
    end
  end
end