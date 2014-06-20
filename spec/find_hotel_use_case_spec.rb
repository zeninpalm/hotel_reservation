require 'spec_helper'

def set_up_hotel(hotel, rates1, rates2, rates3, rates4)
  policy = make_rates_policy(us_dollar(rates1), us_dollar(rates2), us_dollar(rates3), us_dollar(rates4))
  r = make_set_rates_request(hotel, policy)
  use_case.executes(r)
end

describe HotelReservation::FindHotelUseCase do
  let!(:initial) { us_dollar(0) }
  let!(:regular_user) { make_customer("REGULAR") }
  let!(:weekend) { make_date("2014-6-14") }
  let!(:another_weekend) { make_date("2014-6-15") }
  let!(:weekday) { make_date("2014-6-16") }
  let!(:use_case) { make_set_rates_use_case }
  let!(:dates) { [weekend, another_weekend, weekday] } 
  let!(:find_use_case) { make_find_hotel_use_case }
    
  it "returns the cheapest hotel" do
    hotel = make_hotel("First Hotel", 3)
    set_up_hotel(hotel, 0, 0, 0, 0)

    second_hotel = make_hotel("Second Hotel", 3)
    set_up_hotel(second_hotel, 1, 1, 1, 1)

    third_hotel = make_hotel("Third Hotel", 3)
    set_up_hotel(third_hotel, 2, 2, 2, 2)

    hotels = [hotel, second_hotel, third_hotel]

    find_request = make_find_hotel_request(regular_user, dates, hotels, initial)
    cheapest = find_use_case.executes(find_request)
    expect(cheapest[1].name).to eql(hotel.name)
  end
  it "returns the highest rating hotel" do
    hotel = make_hotel("First Hotel", 3)
    set_up_hotel(hotel, 0, 0, 0, 0)

    second_hotel = make_hotel("Second Hotel", 4)
    set_up_hotel(second_hotel, 0, 0, 0, 0)

    third_hotel = make_hotel("Third Hotel", 5)
    set_up_hotel(third_hotel, 0, 0, 0, 0)

    hotels = [hotel, second_hotel, third_hotel]

    find_request = make_find_hotel_request(regular_user, dates, hotels, initial)
    find_use_case = make_find_hotel_use_case
    cheapest = find_use_case.executes(find_request)
    expect(cheapest[1].name).to eql(third_hotel.name)
  end
  it "returns the cheapest hotel in different order" do
    hotel = make_hotel("First Hotel", 3)
    set_up_hotel(hotel, 2, 2, 2, 2)

    second_hotel = make_hotel("Second Hotel", 4)
    set_up_hotel(second_hotel, 1, 1, 1, 1)

    third_hotel = make_hotel("Third Hotel", 5)
    set_up_hotel(third_hotel, 0, 0, 0, 0)

    hotels = [hotel, second_hotel, third_hotel]

    find_request = make_find_hotel_request(regular_user, dates, hotels, initial)
    find_use_case = make_find_hotel_use_case
    cheapest = find_use_case.executes(find_request)
    expect(cheapest[1].name).to eql(third_hotel.name)
  end
end
