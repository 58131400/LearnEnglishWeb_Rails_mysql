class Student < ApplicationRecord
  self.table_name = 'student'

  belongs_to :user, optional: true
  belongs_to :classdb, optional: true

  has_many :studentparts
  has_many :StudentTests
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates_uniqueness_of :StudentCard, message: 'Your Student card is not valid'

end
