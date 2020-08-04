class PartAudio < ApplicationRecord
  self.table_name = 'part_audio'
  belongs_to :Part, optional: true
  belongs_to :audio, optional: true
end
