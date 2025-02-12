class Role < ApplicationRecord
  self.table_name = :roles

  has_many :accounts
end

