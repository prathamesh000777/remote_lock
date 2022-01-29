class ParsePeopleData
  attr_reader :params

  def initialize(params)
    @params = params
    @persons = []
  end

  def execute
    populate_persons
    @persons
  end

  private

  def populate_persons
    Person::PEOPLE_DATA_FORMATS.each do |format|
      data = params["#{format}_format".to_sym]
      next if data.nil?

      parsed_persons = PeopleDataParser::Factory.parse(data, format)
      @persons += parsed_persons
    end
  end
end