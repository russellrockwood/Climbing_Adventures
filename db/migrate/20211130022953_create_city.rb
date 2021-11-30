class CreateCity < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :travel_advisory
      t.integer :population
      t.timestamps
    end
  end
end
