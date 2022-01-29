class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    persons = ParsePeopleData.new(params).execute
    sorted_persons = Person.sort_by(persons, params[:order])
    sorted_persons.map do |person|
      "#{person.first_name}, #{person.city}, #{person.birthdate.strftime("%-m/%-e/%Y")}"
    end
  end

  private

  attr_reader :params
end
