require 'spec_helper'

describe HotelReservation::USDollarRates do
  it "may return value" do
    rates = HotelReservation::USDollarRates.new(100)
    expect(rates.value).to eql(100)
  end
end
