class Person
  attr_accessor :first_name, :last_name, :city, :birthdate

  PEOPLE_DATA_FORMATS = %w[dollar percent]

  def self.sort_by(persons, attr_name)
    persons.sort { |a,b| (a.send(attr_name)&.downcase || '') <=> (b.send(attr_name)&.downcase || '') }
  end
end