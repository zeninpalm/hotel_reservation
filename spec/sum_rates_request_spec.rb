require 'spec_helper'

describe HotelReservation::SumRatesRequest do
  it "instantiates with user, dates, rates_policy" do
    HotelReservation::SumRatesRequest.new(nil, nil, nil)
  end
end

