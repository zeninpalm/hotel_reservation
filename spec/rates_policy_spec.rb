require 'spec_helper'

describe HotelReservation::RatesPolicy do
  before "allows adding applicability with rates" do
    @policy = HotelReservation::RatesPolicy.new
    filter = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rates = HotelReservation::USDollarRates.new(100)

    @policy.add_entry(filter, rates)
  end

  it "returns corresponding rates when filter matched" do
    rewarded_customer = HotelReservation::RewardedCustomerFactory.make
    weekend = HotelReservation::HotelDate.parse("2014-6-14")
    
    filter1 = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    rates = @policy.apply(rewarded_customer, weekend)
    expect(rates).to eql(100)
  end
end

