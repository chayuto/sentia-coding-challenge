class Person < ApplicationRecord
    require 'csv'
    validates :first_name, presence: true
    has_and_belongs_to_many :affiliations
    has_and_belongs_to_many :locations


    def self.import(file)        
        CSV.foreach(file.path,headers: true) do |row|
            
            puts row.to_h
            new_person = Person.import_row(row.to_h)
           
        end
    end

    
    #Take in hashmap of person data and return person instance if valid
    #return nil if failed validation
    #seperate function for easier unit testing
    def self.import_row(input_hash)
        
        person_affiliation_str = input_hash["Affiliations"]
        #check requirement: d. A Person without an Affiliation should be skipped
        #input validation before logic processing
        if person_affiliation_str.blank?
            #blank handle nil, "" and " "
            return nil
        end

        #input validation before logic processing
        person_name_input_str = input_hash["Name"]
        if person_affiliation_str.blank?
            return nil
        end
        
        #business logic processing
        affiliation_name_list = person_affiliation_str.split(",")

        affiliation_list = []
        affiliation_name_list.each do |input_affiliation_name|
            affiliation_name = input_affiliation_name.strip #trim white spaces

            a = Affiliation.where(name:affiliation_name ).first_or_create
            affiliation_list.push(a)
            puts a.name
        end

        species = input_hash["Species"]
        #from sample input, further valid processing is only applicable to "Human"

        if(species == "Human")
            gender = PeopleHelper.map_gender(input_hash["Gender"])
            puts gender
            name_titles =  name.strip.split(" ")
            first_name = name_titles[0]&.titleize
            last_name =  name_titles[1]&.titleize
        else
            gender =input_hash["Gender"] 
            first_name = input_hash["Name"]
            last_name = nil 
        end

        new_person = Person.new(
            first_name:first_name,
            last_name:last_name,
            species:species,
            gender:gender,
            weapon:input_hash["Weapon"],
            vehicle:input_hash["Vehicle"])

        new_person.affiliations <<  affiliation_list

        new_person.save
    end
end
