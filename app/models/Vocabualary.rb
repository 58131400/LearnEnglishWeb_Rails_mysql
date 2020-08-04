class Vocabualary < ApplicationRecord
  self.table_name = 'vocabualary'
  alias_attribute 'part_id', 'vocabualary_id'
  has_many :words
  belongs_to :Part, optional: true
end
