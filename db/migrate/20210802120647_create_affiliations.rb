class CreateAffiliations < ActiveRecord::Migration[5.1]
  def change
    create_table :affiliations, comment: 'affiliations table' do |t|
      t.string :name, comment: 'affiliation name'
      t.timestamps
    end
  end
end
