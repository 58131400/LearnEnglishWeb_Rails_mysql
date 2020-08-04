class RightAnswer <ApplicationRecord
  self.table_name ="rightanswer"
  belongs_to :exercise, optional: true
  belongs_to :selection, optional: true
end
