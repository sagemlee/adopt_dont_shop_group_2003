require 'rails_helper'

describe Application, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
  end

  describe "relationships" do
      it { should have_many :pet_applications}
      it { should have_many(:pets).through(:pet_applications)}
  end

  describe "methods" do
    it "approved_application" do
      application1 = create(:application)
      application2 = create(:application)
      application3 = create(:application, approval_status: "true")

      applications = Application.all

      expect(applications.approved_application).to eq(application3)
    end 
  end 

end
