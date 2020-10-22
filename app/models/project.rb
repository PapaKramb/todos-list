class Project < ApplicationRecord
  has_many :todos, inverse_of: :project
  accepts_nested_attributes_for :todos, allow_destroy: true
end
