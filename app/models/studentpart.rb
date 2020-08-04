class Studentpart < ApplicationRecord
  self.table_name = 'studentpart'
  belongs_to :Part, optional: true
  belongs_to :student, optional: true
end
