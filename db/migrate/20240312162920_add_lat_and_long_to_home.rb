class AddLatAndLongToHome < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :latitude, :float
    add_column :homes, :longitude, :float
  end
end
