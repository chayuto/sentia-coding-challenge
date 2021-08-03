class Person < ApplicationRecord
    require 'csv'
    validates :first_name, presence: true
    has_and_belongs_to_many :affiliations
    has_and_belongs_to_many :locations


    def self.import(file)   
        valid_imports = []     
        CSV.foreach(file.path,headers: true) do |row|
            
            
            puts row.to_h
            new_person = Person.import_row(row.to_h)
           
            if new_person.present?
                valid_imports.push(new_person)
            end
        end
        valid_imports
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
            if input_affiliation_name.blank?
                next
            end
            affiliation_name = input_affiliation_name.strip #trim white spaces

            a = Affiliation.where(name:affiliation_name ).first_or_create
            affiliation_list.push(a)
            #puts a.name
        end

        person_location_str = input_hash["Location"]
        location_list = []
        unless person_location_str.blank?
            location_name_list = person_location_str.split(",")
            
            location_name_list.each do |input_location_name|

                if input_location_name.blank?
                    next
                end
                #trim white spaces and titleize
                location_name = input_location_name.strip.titleize 

                loc = Location.where(name:location_name).first_or_create
                location_list.push(loc)
                #puts loc.name
            end
        end
        species = input_hash["Species"]
        
        #from sample input, further valid processing is only applicable to "Human"


        if(species == "Human")
          
            name_titles = input_hash["Name"].strip.split(" ")
            first_name = name_titles[0]&.titleize
            last_name =  name_titles[1]&.titleize
        else
            first_name = input_hash["Name"]
            last_name = nil 
        end

        new_person = Person.new(
            first_name:first_name,
            last_name:last_name,
            species:species,
            gender:PeopleHelper.map_gender(input_hash["Gender"]),
            weapon:input_hash["Weapon"],
            vehicle:input_hash["Vehicle"])

        new_person.affiliations <<  affiliation_list
        new_person.locations <<  location_list

        if(new_person.save)
            return new_person
        else
            return nil
        end

    end

    
end
