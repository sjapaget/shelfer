class AddNameToShelf < ActiveRecord::Migration[7.0]
  def change
    add_column :shelves, :name, :string
    add_column :shelves, :description, :text
    add_reference :shelves, :user, null: false, foreign_key: true
  end
end
