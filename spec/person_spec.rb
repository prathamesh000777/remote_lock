require 'spec_helper'

RSpec.describe Person do
  describe 'initialise' do
    it "gets initialised and return the attributes" do 
      person = Person.new()
      person.first_name = 'rahul'
      person.last_name = 'jain'
      person.birthdate = '25-09-1995'
      person.city = 'mumbai'
      expect(person.first_name).to eq('rahul')
      expect(person.last_name).to eq('jain')
      expect(person.birthdate).to eq('25-09-1995')
      expect(person.city).to eq('mumbai')
      expect(person.first_name).not_to eq('rahul1')
      expect(person.last_name).not_to eq('jain1')
      expect(person.birthdate).not_to eq('25-09-1995-1')
      expect(person.city).not_to eq('mumbai1')
    end
  end

  describe 'sorts persons by attribute' do

    let(:person1) do 
      person = Person.new()
      person.first_name = 'rahul'
      person.last_name = 'jain'
      person.birthdate = '25-09-1995'
      person.city = 'mumbai'
      person
    end

    let(:person2) do 
      person = Person.new()
      person.first_name = 'amit'
      person.last_name = 'rathod'
      person.birthdate = '25-09-1995'
      person.city = 'mumbai'
      person
    end

    it 'sorts the person by first_name' do
      persons = [person1, person2]
      expect(Person.sort_by(persons,'first_name').first.first_name).to eq('amit')
    end

    it 'sorts the person by last_name' do
      persons = [person1, person2]
      expect(Person.sort_by(persons,'last_name').first.last_name).to eq('jain')
    end
  end
end
