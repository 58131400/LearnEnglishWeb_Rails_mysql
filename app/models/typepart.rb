class Typepart < ApplicationRecord
  self.table_name = 'typepart'
  has_many :Parts
end
