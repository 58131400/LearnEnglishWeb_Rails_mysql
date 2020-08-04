class Speaking < ApplicationRecord
  self .table_name = 'speaking'
  alias_attribute  :'part_id' , :'speaking_id'
  belongs_to :Part, optional: true
end
