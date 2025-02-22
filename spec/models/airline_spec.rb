require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
    it {should have_many(:passengers).through(:flights)}
  end

  before :each do
    @airline1 = Airline.create!(name: "Frontier")
    @airline2 = Airline.create!(name: "Hawaiian")
    @flight1 = @airline1.flights.create!(number: "1777", date: "01/03/23", departure_city: "Denver", arrival_city: "Portland")
    @flight2 = @airline1.flights.create!(number: "1007", date: "05/03/24", departure_city: "Boston", arrival_city: "Honolulu")
    @flight3 = @airline1.flights.create!(number: "1035", date: "01/05/24", departure_city: "Honolulu", arrival_city: "Fiji")
    @flight4 = @airline2.flights.create!(number: "2256", date: "15/12/24", departure_city: "Big Island", arrival_city: "Honolulu")
    @flight5 = @airline1.flights.create!(number: "1001", date: "01/01/25", departure_city: "Honolulu", arrival_city: "Boston")
    @passenger1 = Passenger.create!(name: "Dave", age: 33)
    @passenger2 = Passenger.create!(name: "Gianna", age: 29)
    @passenger3 = Passenger.create!(name: "Daisy", age: 1)
    @passenger4 = Passenger.create!(name: "Kita", age: 5)
    @passenger5 = Passenger.create!(name: "Bob", age: 35)
    @passenger6 = Passenger.create!(name: "Steve", age: 55)
    @passenger7 = Passenger.create!(name: "Sally", age: 25)
    @passenger8 = Passenger.create!(name: "Sue", age: 45)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger1)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger2)
    PassengerFlight.create!(flight: @flight2, passenger: @passenger3)
    PassengerFlight.create!(flight: @flight2, passenger: @passenger4)
    PassengerFlight.create!(flight: @flight3, passenger: @passenger5)
    PassengerFlight.create!(flight: @flight3, passenger: @passenger6)
    PassengerFlight.create!(flight: @flight4, passenger: @passenger7)
    PassengerFlight.create!(flight: @flight5, passenger: @passenger1)
  end

  it '.show_uniq_adults' do
    expect(@airline1.show_distinct_adults).to match([@passenger1, @passenger2, @passenger5, @passenger6])
  end
end
