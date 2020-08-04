class Part < ApplicationRecord
  self.table_name = "part"
  belongs_to :unit, optional: true
  has_many :part_audios
  belongs_to :typepart, optional: true
  has_many :studentparts
  has_many :words
  has_many :ExerciseParts
  has_many :exercises, through: :ExerciseParts
end
