require 'spec_helper'

describe HotelReservation::SetRatesUseCaseRequest do
  context "instantiation" do
    it "instantiates with hotel, rates_policy" do
      namer = HotelReservation::Namer.new("First Hotel")
      ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
      hotel = HotelReservation::Hotel.build(namer, ratinger)

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

      r = HotelReservation::SetRatesUseCaseRequest.new(hotel, policy)
    end
  end
end

