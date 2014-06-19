require 'spec_helper'

describe HotelReservation::Namer do
  context "accessing names" do
    let!(:hotel_name) { "Some Hotel" }
    let(:namer) { HotelReservation::Namer.new(hotel_name) }

    it "instantiates with given name" do
      expect(HotelReservation::Namer.new(hotel_name)).to be
    end

    it "doesn't instantiate without given name" do
      expect { HotelReservation::Namer.new }.to raise_error
    end

    it "returns given name" do
      expect(namer.name).to eql(hotel_name)
    end

    it "may change given initial name" do
      new_name = "New Hotel Name"
      namer.name = new_name
      expect(namer.name).to eql(new_name)
    end
  end
end

