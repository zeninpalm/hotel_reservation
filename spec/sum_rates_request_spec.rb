require 'spec_helper'

describe HotelReservation::SumRatesRequest do
  it "instantiates with user, dates, rates_policy, initial" do
    HotelReservation::SumRatesRequest.new(nil, nil, nil, nil)
  end
end

