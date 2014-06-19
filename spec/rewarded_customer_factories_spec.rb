require 'spec_helper'

describe HotelReservation::RegularCustomerFactory do
  let(:factory) { HotelReservation::RegularCustomerFactory }

  it "creates regular customer" do
    customer = factory.make
    expect(customer).to be_a(HotelReservation::RegularCustomer)
  end
end

