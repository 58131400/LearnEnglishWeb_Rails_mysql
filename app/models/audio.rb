
class Audio < ApplicationRecord
  self.table_name = "audio"
  has_many :part_audios
  has_one :word
end
