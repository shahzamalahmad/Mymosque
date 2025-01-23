class AboutUs < ApplicationRecord
  self.table_name = :about_us
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # geocoded_by :address   # Assuming 'address' is a column in your User model

  # after_validation :geocode
  # devise :database_authenticatable, 
         # :recoverable, :rememberable, :validatable

  # def self.ransackable_attributes(auth_object = nil)
  #   super & ['created_at', 'email'] # Add other attributes you want to allow for searching
  # end
end

