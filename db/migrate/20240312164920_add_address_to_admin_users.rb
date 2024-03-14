class AddAddressToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :address, :string
  end
end
