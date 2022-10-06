class CreatePlacements < ActiveRecord::Migration[7.0]
  def change
    create_table :placements do |t|
      t.references :book, null: false, foreign_key: true
      t.references :shelf, null: false, foreign_key: true

      t.timestamps
    end
  end
end
