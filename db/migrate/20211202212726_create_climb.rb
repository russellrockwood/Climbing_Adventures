class CreateClimb < ActiveRecord::Migration[5.2]
  def change
    create_table :climbs do |t|
      t.string :name
      t.string :sport_or_trad
      t.string :yds_difficulty
      t.integer :number_of_pitches
      t.integer :number_of_draws
      t.boolean :dangerous_falls
      t.timestamps
    end
  end
end
