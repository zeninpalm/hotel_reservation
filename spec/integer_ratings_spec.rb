require 'spec_helper'

describe HotelReservation::IntegerRank do
  let!(:rank) { HotelReservation::IntegerRank.new(3) }

  it "may return rank value" do
    expect(rank.value).to eql(3)
  end
  
  it "may change rank vlaue" do
    new_value = 4
    rank.value = new_value
    expect(rank.value).to eql(new_value)
  end
end
