class CreateHostel < ActiveRecord::Migration[5.2]
  def change
    create_table :hostels do |t|
      t.string :name
      t.boolean :vacancies
      t.integer :max_occupancy
      t.timestamps
    end
  end
end
