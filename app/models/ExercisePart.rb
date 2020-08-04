class ExercisePart <ApplicationRecord
  self.table_name = 'exercise_part'
  belongs_to :Part, optional: true
  belongs_to :exercise, optional: true
end
