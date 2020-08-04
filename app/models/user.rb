class User < ApplicationRecord
  self.table_name = 'user'

  validates_uniqueness_of :username, message: 'This account already exist!'
  has_one :student
  has_one :teacher
  has_many :user_roles
  has_many :videos

  has_secure_password
end


