require 'rails_helper'

RSpec.describe Person, type: :model do
 
  it "has none to begin with" do
    expect(Person.count).to eq 0
  end


  it "should create new person with valid input" do

    p = Person.create(
      first_name:"john",
      last_name:"citizen",
      species:"Human",
      gender:"M",
      weapon:"-",
      vehicle:"BMW")
    expect(Person.count).to eq 1

  end


  it "should import new row with hash #1" do

  expect(Person.count).to eq 0

  input_hash = {"Name"=>"Chewbacca", "Location"=>"kashyyk", "Species"=>"Wookie", "Gender"=>"m", "Affiliations"=>"Rebel Alliance", "Weapon"=>"Bowcaster", "Vehicle"=>"Millennium Falcon"}

  Person.import_row(input_hash)

  expect(Person.count).to eq 1

  end

end
