module PeopleHelper

    #if common m/M/Male to standard string
    def self.map_gender(input_str)

        normalised_str = input_str.downcase()
        

        if normalised_str.match(/^(m)$|^(male)$/)
            out_str ="M"

        elsif normalised_str.match(/^(f)$|^(female)$/)
            out_str ="F"
        else
            out_str = input_str
        end

        out_str

    end
end
