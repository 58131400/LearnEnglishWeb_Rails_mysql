class UserRole < ApplicationRecord
  self.table_name = 'userrole'
  belongs_to :user, optional: true
  belongs_to :Role, optional: true
end