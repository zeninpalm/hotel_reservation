require 'spec_helper'

describe HotelReservation::SumRatesUseCase do
  it "has executes inteface accepting SumRatesRequest" do
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)

    rates_100 = HotelReservation::USDollarRates.new(100)
    rates_190 = HotelReservation::USDollarRates.new(190)
    rates_320 = HotelReservation::USDollarRates.new(320)
    rates_170 = HotelReservation::USDollarRates.new(170)

    policy.add_entry(rewarded_weekend, rates_100)
    policy.add_entry(rewarded_weekday, rates_190)
    policy.add_entry(regular_weekend, rates_320)
    policy.add_entry(regular_weekday, rates_170)

    regular_customer = HotelReservation::RegularCustomerFactory.make
    weekend = HotelReservation::HotelDate.parse("2014-6-14") 
    next_weekend = HotelReservation::HotelDate.parse("2014-6-15") 
    weekday = HotelReservation::HotelDate.parse("2014-6-16") 

    sum_rates_request = HotelReservation::SumRatesRequest.new(
      regular_customer, [weekend, next_weekend, weekday], policy)
    sum_rates_use_case = HotelReservation::SumRatesUseCase.new
    sum = sum_rates_use_case.executes(sum_rates_request)

    expect(sum).to eql(810)
  end
end

