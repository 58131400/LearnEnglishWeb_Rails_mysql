class Testdb < ApplicationRecord
  self.table_name = 'testdb'
  has_many :test_exercises
  has_many :StudentTests
  belongs_to :classDb, optional: true
  has_many :exercises, through: :test_exercises
  validate :start_must_be_before_end_time
  validates :startTime, presence: {message: 'must be a valid date/time'}
  validates :finishTime, presence: {message: 'must be a valid date/time'}

  def start_must_be_before_end_time
    errors.add(:startTime, 'must be before end time') unless startTime < finishTime
  end
end
