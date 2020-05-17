class RemoveApprovalStatusFromApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :approval_status, :string
  end
end
