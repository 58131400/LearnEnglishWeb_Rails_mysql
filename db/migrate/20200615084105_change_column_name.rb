class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :studentbook, :UserID, :user_id
    rename_column :student, :UserID, :user_id
    rename_column :studentbook, :BookId, :book_id
  end
end
