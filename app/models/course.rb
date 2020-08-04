class Course < ApplicationRecord
  self.table_name = 'course'
  belongs_to :book, optional: true
  has_many :student_courses
  has_many :students, through: :student_courses

  has_many :course_managements
  has_many :teachers, through: :course_managements
end