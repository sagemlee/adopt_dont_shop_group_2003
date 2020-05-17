class RemoveApprovedFromPetApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :pet_applications, :approved, :string
  end
end
