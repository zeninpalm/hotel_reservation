require 'spec_helper'

describe HotelReservation::FindHotelRequest do
  it "instantiates with user, dates and hotels" do
    HotelReservation::FindHotelRequest.new(nil, nil, nil)
  end
end
