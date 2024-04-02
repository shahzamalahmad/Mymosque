class AddIsApprovedToHomes < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :is_approved, :boolean, null: false, default: false
  end
end
