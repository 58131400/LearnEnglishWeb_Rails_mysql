class CourseManagement < ApplicationRecord
  self.table_name = 'coursemanagement'
  belongs_to :course, optional: true
  belongs_to :teacher, optional: true
end
