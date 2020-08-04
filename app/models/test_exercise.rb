class TestExercise < ApplicationRecord
  self.table_name = 'test_exercise'
  belongs_to :testdb,optional: true
  belongs_to :exercise,optional: true
end
