class Person < ApplicationRecord
    require 'csv'
    has_and_belongs_to_many :affiliations
    has_and_belongs_to_many :locations


    def self.import(file)

        
            CSV.foreach(file.path,headers: true) do |row|
                puts "@@@#{row}"

            end
      

    end
end
