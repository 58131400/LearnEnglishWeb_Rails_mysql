class Video < ApplicationRecord
  self.table_name = 'video'
  belongs_to :user, optional: true
  has_one_attached :clip
  has_one_attached :thumbnail
  validates :thumbnail, presence: true
  validates :clip,presence: true
 end
