class AddApprovalStatusToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :approval_status, :string
  end
end
