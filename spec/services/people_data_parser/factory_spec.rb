require 'spec_helper'

RSpec.describe PeopleDataParser::Factory do
  describe 'Parses Dollar format data' do

    let(:dollar_data) { File.read('spec/fixtures/people_by_dollar.txt') }

    it 'Parses the Dollar format data' do
      parsed_data = PeopleDataParser::Factory.parse(dollar_data, 'dollar')
      expect(parsed_data.length).to eq(2)
      expect(parsed_data.first.class).to eq(Person)

      person = parsed_data.first
      expect(person.first_name).to eq('Rhiannon')
      expect(person.last_name).to eq('Nolan')
      expect(person.city).to eq('Los Angeles')
      expect(person.birthdate.class).to eq(Date)
      expect(person.birthdate).to eq(Date.parse('30-4-1974'))
    end

    let(:percent_data) { File.read('spec/fixtures/people_by_percent.txt') }

    it 'Parses the Percent format data' do
      parsed_data = PeopleDataParser::Factory.parse(percent_data, 'percent')
      expect(parsed_data.length).to eq(2)
      expect(parsed_data.first.class).to eq(Person)

      person = parsed_data.first
      expect(person.first_name).to eq('Mckayla')
      expect(person.last_name).to eq(nil)
      expect(person.city).to eq('Atlanta')
      expect(person.birthdate.class).to eq(Date)
      expect(person.birthdate).to eq(Date.parse('1986-05-29'))
    end

    it 'Raises StandardError error for invalid format' do
      expect { PeopleDataParser::Factory.parse(percent_data, 'random') }.to raise_error(StandardError)
    end
  end
end
