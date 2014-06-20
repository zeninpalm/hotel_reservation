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
    let(:regular_user) { make_customer("REGULAR") }
    let(:weekend) { HotelReservation::HotelDate.parse("2014-6-15") }
    
    it "matches regular user on weekend" do
      filter = HotelReservation::ApplicabilityFilter.new do |user, date|
        (not user.rewarded?) and (date.weekend?)
      end
      expect(filter.matched?(regular_user, weekend)).to be_truthy
      filter = HotelReservation::ApplicabilityFilter.new do |user, date|
        (user.rewarded?) and (date.weekend?)
      end
      expect(filter.matched?(regular_user, weekend)).to be_falsey
      filter = HotelReservation::ApplicabilityFilter.new do |user, date|
        (user.rewarded?) and (not date.weekend?)
      end
      expect(filter.matched?(regular_user, weekend)).to be_falsey
      filter = HotelReservation::ApplicabilityFilter.new do |user, date|
        (not user.rewarded?) and (not date.weekend?)
      end
      expect(filter.matched?(regular_user, weekend)).to be_falsey
    end
  end
end
