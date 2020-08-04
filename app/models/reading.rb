class Reading < ApplicationRecord
  self.table_name = 'reading'

  belongs_to :Part, optional: true
end
