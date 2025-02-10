class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Default ransackable attributes for all models
  def self.ransackable_attributes(auth_object = nil)
    attribute_names
  end

  # Default ransackable associations for all models (can be overridden)
  def self.ransackable_associations(auth_object = nil)
    []
  end
end