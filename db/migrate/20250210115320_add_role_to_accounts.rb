class AddRoleToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :role, foreign_key: true
    add_column :accounts, :approved, :boolean, default: false
  end
end
