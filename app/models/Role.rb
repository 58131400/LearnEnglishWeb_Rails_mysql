class Role < ApplicationRecord
  self.table_name = 'role'
  has_many :user_roles
end
