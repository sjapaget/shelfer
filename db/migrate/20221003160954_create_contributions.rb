class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.references :book, null: false, foreign_key: true
      t.references :contributor, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
