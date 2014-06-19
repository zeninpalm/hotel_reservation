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
  context "accessing" do
    let!(:namer) { HotelReservation::Namer.new("Some Hotel") }
    let!(:ratinger) { HotelReservation::Ratinger.new(3) }
    let!(:hotel) { HotelReservation::Hotel.build(namer, ratinger) }

    it "can return name" do
      expect(hotel.name).to eql(namer.name)
    end

    it "can return rating" do
      expect(hotel.rating).to eql(ratinger.rating)
    end

    it "can change name" do
      new_name = "New Hotel"
      hotel.name = new_name
      expect(hotel.name).to eql(new_name)
    end
    
    it "can change rating" do
      new_rating = 4 
      hotel.rating = new_rating
      expect(hotel.rating).to eql(new_rating)
    end

  end
end

