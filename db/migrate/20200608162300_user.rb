class User < ActiveRecord::Migration[6.0]
  def change

    change_column :user, :UserID, :string,:limit => 10, default: nil
    change_column :user, :Name,:string, :limit => 255
    change_column :user, :Email,:string, :limit => 255
    change_column :user, :Phone,:string, :limit => 10
    change_column :user, :username,:string, :limit => 255
    change_column :user, :TypeUser,:integer
    change_column :user, :password_digest,:string, :limit => 255
  end
end
