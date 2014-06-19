require "spec_helper"

describe HotelReservation::Hotel do
  context "initialization" do
    it "can't be directly instantiated" do
      expect { HotelReservation::Hotel.new('', '') }.to raise_error(NoMethodError)
    end
    it "can be instantiated by calling build method" do
      expect(HotelReservation::Hotel.build('', '')).to be
    end
  end
end

