require 'spec_helper'

describe HotelReservation::FindHotelRequest do
  it "instantiates with user, dates, hotels and initial" do
    HotelReservation::FindHotelRequest.new(nil, nil, nil, nil)
  end
end
