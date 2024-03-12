class AddColumnTypeToHomesTable < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :category, :string, null: false
    add_column :homes, :address, :string, null: false
    add_column :homes, :full_name, :string, null: false
    add_column :homes, :first_name, :string
    add_column :homes, :last_name, :string
    add_column :homes, :manager, :string, null: false
    add_column :homes, :imam, :string, null: false
    add_column :homes, :contact_no, :integer
    add_column :homes, :email, :email
    add_column :homes, :whatsapp, :integer
  end
end
