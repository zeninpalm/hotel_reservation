require 'spec_helper'

describe HotelReservation::Rates do
  describe "instantiation" do
    it "instantiates with filter block" do
      rates = HotelReservation::Rates.new {}
    end
  end
  describe "#applicable?" do
    it "calls given filter block in #applicable?" do
      result = "Filter Result"
      rates = HotelReservation::Rates.new { |user, date| result }
      expect(rates.applicable?(nil, nil)).to eql(result)
    end
  end
end
