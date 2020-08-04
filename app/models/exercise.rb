class Exercise < ApplicationRecord
  self.table_name = "exercise"
  belongs_to :Part, optional: true
  has_many :selections
  has_one :RightAnswer
  has_one :test_exercise
  has_one :ExercisePart
end
