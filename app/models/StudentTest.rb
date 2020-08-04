class StudentTest <ApplicationRecord
  self.table_name ='student_test'
  belongs_to :student, optional: true
  belongs_to :testdb, optional: true
end
