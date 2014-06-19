require 'spec_helper'

describe HotelReservation::RewardedCustomerFactory do
  let(:factory) { HotelReservation::RewardedCustomerFactory }

  it "creates rewarded customer" do
    customer = factory.make
    expect(customer).to be_a(HotelReservation::RewardedCustomer)
  end
end

