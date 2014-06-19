require 'spec_helper'

describe HotelReservation::RegularCustomer do
  describe "#rewarded?" do
    it "returns false" do
      customer = HotelReservation::RegularCustomer.new
      expect(customer.rewarded?).to be_falsey
    end
  end
end

