class Selection < ApplicationRecord
  self.table_name ="selection"
  belongs_to :exercise, optional: true
  has_one :RightAnswer
end
