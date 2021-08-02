class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people, comment: 'Starwars universe People table' do |t|
      t.string :first_name, comment: 'person first name'
      t.string :last_name, comment: 'person last name (optional)'
      t.string :species, comment: 'person Species'
      t.string :gender, comment: 'gender [m/f/others]'
      t.string :weapon, comment: 'Weapon'
      t.string :vehicle, comment: 'Vehicle'
      t.timestamps
    end
  end
end
