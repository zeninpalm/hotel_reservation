require 'spec_helper'

describe HotelReservation::Ratinger do
  context "accessing ratings" do
    let!(:hotel_rating) { HotelReservation::IntegerRank.new(3) }
    let(:ratinger) { HotelReservation::Ratinger.new(hotel_rating) }

    it "instantiates with given rating" do
      expect(HotelReservation::Ratinger.new(hotel_rating)).to be
    end

    it "doesn't instantiate without given rating" do
      expect { HotelReservation::Ratinger.new }.to raise_error
    end

    it "returns given rating" do
      expect(ratinger.rating).to eql(hotel_rating)
    end

    it "may change given initial rating" do
      new_rating = HotelReservation::IntegerRank.new(4)
      ratinger.rating = new_rating
      expect(ratinger.rating).to eql(new_rating)
    end
  end
end

