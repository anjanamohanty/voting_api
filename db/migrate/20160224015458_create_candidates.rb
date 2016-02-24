class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :district
      t.string :hometown
      t.string :party
      t.integer :race_id

      t.timestamps null: false
    end
  end
end
