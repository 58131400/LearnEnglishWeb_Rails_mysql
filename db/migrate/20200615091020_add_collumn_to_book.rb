class AddCollumnToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :book, :image,:string
  end
end
