class StudentCourse < ApplicationRecord
  self.table_name = 'student_course'
  belongs_to :course, optional: true
  belongs_to :student, optional: true
end
