require 'spec_helper'

RSpec.describe ParsePeopleData do
  describe 'Parses people data' do

    let(:params_with_two_format) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt')
      }
    end

    it 'Parses data and return an array of length 4 for combined set of two formats' do
      persons = ParsePeopleData.new(params_with_two_format).execute
      expect(persons.length).to eq(4)
      expect(persons.first.class).to eq(Person)
    end

    let(:params_with_only_dollar_format) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt')
      }
    end

    it 'Parses data and return an array of length 2 for single format of dollar type' do
      persons = ParsePeopleData.new(params_with_only_dollar_format).execute
      expect(persons.length).to eq(2)
    end

    let(:params_with_only_percent_format) do
      {
        percent_format: File.read('spec/fixtures/people_by_percent.txt')
      }
    end

    it 'Parses data and return an array of length 2 for single format of percent type' do
      persons = ParsePeopleData.new(params_with_only_percent_format).execute
      expect(persons.length).to eq(2)
    end

    let(:params_with_no_data) do
      {}
    end

    it 'Returns an empty array for no data' do
      persons = ParsePeopleData.new(params_with_no_data).execute
      expect(persons.length).to eq(0)
    end
  end
end
