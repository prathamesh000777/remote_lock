require 'csv'
module PeopleDataParser
  class Base
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def parse
      return [] if data.nil?

      parsed_data = CSV.new(data, headers:true, col_sep: col_sep).read
      headers = col_map.keys
      parsed_data.map do |row|
        map_fields(row, headers)
      end
    end

    private

    def map_fields(person_raw, headers)
      person = Person.new
      headers.each do |attr_name|
        col_number = col_map[attr_name.to_sym]
        person.send("#{attr_name}=", send(attr_name.to_sym, person_raw, col_number))
      end
      person
    end

    def city(person_raw, col_number)
      person_raw[col_number].strip
    end

    def birthdate(person_raw, col_number)
      Date.parse(person_raw[col_number].strip)
    end

    def last_name(person_raw, col_number)
      person_raw[col_number].strip
    end

    def first_name(person_raw, col_number)
      person_raw[col_number].strip
    end

  end
end
