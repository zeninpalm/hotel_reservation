require 'spec_helper'

describe HotelReservation::HotelDate do
  it "responds to weekend?" do
    d = HotelReservation::HotelDate.new
    expect(d).to respond_to(:weekend?)
  end
  it "recognizes weekend" do
    d = HotelReservation::HotelDate.parse("2014-06-13")
    expect(d.weekend?).to be_truthy
    d = HotelReservation::HotelDate.parse("2014-06-14")
    expect(d.weekend?).to be_truthy
    d = HotelReservation::HotelDate.parse("2014-06-15")
    expect(d.weekend?).to be_truthy
    d = HotelReservation::HotelDate.parse("2014-06-16")
    expect(d.weekend?).to be_falsey
  end
end

