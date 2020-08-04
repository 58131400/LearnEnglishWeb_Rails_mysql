class Book < ApplicationRecord
  self.table_name ="book"
  belongs_to :course, optional: true
  has_many :units

end
