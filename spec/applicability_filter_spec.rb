require 'spec_helper'

describe HotelReservation::ApplicabilityFilter do
  context "instantiation" do
    it "accepts block" do
      filter = HotelReservation::ApplicabilityFilter.new {}
    end
    it "runs given block to decide whether applicable" do
      filter = HotelReservation::ApplicabilityFilter.new {|user, date| true }
      expect(filter.matched?(nil, nil)).to be_truthy
    end
  end
  context "filtering" do
  end
end
