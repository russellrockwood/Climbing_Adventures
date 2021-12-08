class CreateArea < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :nearest_city
      t.string :state
      t.boolean :has_free_camping
      t.integer :cost_for_paid_camping
      t.string :rock_type
      t.timestamps
    end
  end
end
