class Unit < ApplicationRecord
  self.table_name = "unit"
  has_many :Parts
  belongs_to :book, optional: true
end
