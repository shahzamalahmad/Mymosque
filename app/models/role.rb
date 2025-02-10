class Role < ApplicationRecord
  self.table_name = :roles

  belongs_to :user
end

