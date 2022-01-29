module PeopleDataParser
  class Factory
    def self.parse(data, format)
      raise StandardError, "Format should be in #{Person::PEOPLE_DATA_FORMATS}, but got '#{format}'" unless Person::PEOPLE_DATA_FORMATS.include?(format.to_s)

      parser = PeopleDataParser.const_get(format.to_s.capitalize)
      parser.new(data).parse
    end
  end
end
