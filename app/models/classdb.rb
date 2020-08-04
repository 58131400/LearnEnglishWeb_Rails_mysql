class Classdb < ApplicationRecord
  self.table_name = 'classdb'
  has_many :students
end

