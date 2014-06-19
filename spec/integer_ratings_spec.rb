require 'spec_helper'

describe HotelReservation::IntegerRating do
  let!(:rating) { HotelReservation::IntegerRating.new(3) }

  it "may return rating value" do
    expect(rating.value).to eql(3)
  end
  
  it "may change rating vlaue" do
    new_value = 4
    rating.value = new_value
    expect(rating.value).to eql(new_value)
  end
end
