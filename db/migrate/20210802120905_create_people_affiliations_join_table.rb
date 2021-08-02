class CreatePeopleAffiliationsJoinTable < ActiveRecord::Migration[5.1]
  def change

    # add an index for faster querying through this join:
    create_join_table :affiliations, :people do |t|
      t.index :affiliation_id
      t.index :person_id
    end
  end
end
