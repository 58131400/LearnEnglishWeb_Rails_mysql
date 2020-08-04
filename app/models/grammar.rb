class Grammar < ApplicationRecord
  self.table_name = 'grammar'
  alias_attribute  :'part_id' , :'grammar_id'
  belongs_to :Part, optional: true
end