class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :password_digest, :string
  end
end
