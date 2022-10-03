class AddTitleToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :title, :string
    add_column :books, :number_of_pages, :integer
    add_column :books, :blurb, :text
  end
end
