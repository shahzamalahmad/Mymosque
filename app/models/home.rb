class Home < ApplicationRecord
	# byebug
	def self.ransackable_attributes(auth_object = nil)
		["address", "latitude", "longitude", "body", "category", "contact_no", "created_at", "email", "first_name", "full_name", "id", "id_value", "imam", "last_name", "manager", "title", "updated_at", "whatsapp", "is_approved"] # Add any other attributes you want to allow for searching
  	end

end
