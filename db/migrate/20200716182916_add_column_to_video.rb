class AddColumnToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :video,  :content, :string

  end
end
