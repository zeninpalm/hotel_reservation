require 'spec_helper'

describe HotelReservation::RatesPolicy do
  before "allows adding applicability with rates" do
    @policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)

    rates_100 = HotelReservation::USDollarRates.new(100)
    rates_190 = HotelReservation::USDollarRates.new(190)
    rates_320 = HotelReservation::USDollarRates.new(320)
    rates_170 = HotelReservation::USDollarRates.new(170)

    @policy.add_entry(rewarded_weekend, rates_100)
    @policy.add_entry(rewarded_weekday, rates_190)
    @policy.add_entry(regular_weekend, rates_320)
    @policy.add_entry(regular_weekday, rates_170)
  end

  it "returns corresponding rates when filter matched" do
    rewarded_customer = HotelReservation::RewardedCustomerFactory.make
    weekend = HotelReservation::HotelDate.parse("2014-6-14")
    rates = @policy.apply(rewarded_customer, weekend)
    expect(rates.value).to eql(100)
    
    regular_customer = HotelReservation::RegularCustomerFactory.make
    weekday = HotelReservation::HotelDate.parse("2014-6-12")
    rates = @policy.apply(regular_customer, weekday)
    expect(rates.value).to eql(170)
  end
end
