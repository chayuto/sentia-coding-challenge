class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations, comment: 'starwars location table' do |t|
      t.string :name, comment: 'location name'
      t.timestamps
    end
  end
end
