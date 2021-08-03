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

  it "should NOT create new person with empty name" do

    p = Person.create(
      first_name:nil,
      last_name:nil,
      species:"Human",
      gender:"M",
      weapon:"-",
      vehicle:"BMW")
    expect(Person.count).to eq 0

  end


  it "should import new row with hash #1" do

    expect(Person.count).to eq 0

    input_hash = {"Name"=>"Chewbacca", "Location"=>"kashyyk", "Species"=>"Wookie",
     "Gender"=>"m", "Affiliations"=>"Rebel Alliance", "Weapon"=>"Bowcaster",
      "Vehicle"=>"Millennium Falcon"}

    p = Person.import_row(input_hash)

    expect(Person.count).to eq 1

    expect(p.first_name).to eq("Chewbacca")
    expect(p.last_name).to be(nil)
    expect(p.locations.count).to eq(1)
    expect(p.locations.first.name).to eq("Kashyyk")
  end

  it "should import new row with hash #2" do

    expect(Person.count).to eq 0

    input_hash = {"Name"=>"Princess Leia", "Location"=>"Alderaan",
     "Species"=>"Human", "Gender"=>"Female", "Affiliations"=>"Rebel Alliance, Galactic Republic",
      "Weapon"=>"Blaster Pistol", "Vehicle"=>nil}

    p = Person.import_row(input_hash)

    expect(Person.count).to eq 1

    expect(p.first_name).to eq("Princess")
    expect(p.last_name).to eq("Leia")
    expect(p.gender).to eq("F")
    expect(p.locations.count).to eq(1)
    expect(p.locations.first.name).to eq("Alderaan")
    expect(p.affiliations.count).to eq(2)
    expect(p.weapon).to eq("Blaster Pistol")
    expect(p.vehicle).to eq(nil)
    
  end

  it "should import new row with hash #3" do

    expect(Person.count).to eq 0

    input_hash = {"Name"=>"luke skywalker", "Location"=>"Tatooine", 
    "Species"=>"Human", "Gender"=>"M", "Affiliations"=>"Rebel Alliance, Jedi Order",
     "Weapon"=>"Lightsaber~!@@@", "Vehicle"=>"X-wing Starfighter"}

    p = Person.import_row(input_hash)

    expect(Person.count).to eq 1

    expect(p.first_name).to eq("Luke")
    expect(p.last_name).to eq("Skywalker")
    expect(p.gender).to eq("M")
    expect(p.species).to eq("Human")
    expect(p.locations.count).to eq(1)
    expect(p.locations.first.name).to eq("Tatooine")
    expect(p.affiliations.count).to eq(2)
    expect(p.weapon).to eq("Lightsaber~!@@@")
    expect(p.vehicle).to eq("X-wing Starfighter")
    
  end

end
