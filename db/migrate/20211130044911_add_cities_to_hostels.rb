class AddCitiesToHostels < ActiveRecord::Migration[5.2]
  def change
    add_reference :hostels, :city, foreign_key: true
  end
end
