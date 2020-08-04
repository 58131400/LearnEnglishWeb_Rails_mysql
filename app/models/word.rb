class Word < ApplicationRecord
  self.table_name ="words"
  belongs_to :Part, optional: true
  belongs_to :audio, optional: true

end
