require 'spec_helper'

describe HotelReservation::RewardedCustomer do
  describe "#rewarded?" do
    it "returns true" do
      customer = HotelReservation::RewardedCustomer.new
      expect(customer.rewarded?).to be_truthy
    end
  end
end

