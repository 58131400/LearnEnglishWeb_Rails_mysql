class Teacher < ApplicationRecord
  self.table_name = 'teacher'
  belongs_to :user, optional: true
  has_many :course_managements
  has_many :courses, through: :course_managements
end
