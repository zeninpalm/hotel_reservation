require 'spec_helper'

describe HotelReservation::RatesPolicy do
  let!(:policy) { make_rates_policy(us_dollar(100), us_dollar(190), us_dollar(320), us_dollar(170)) }
  let!(:rewarded_customer) { make_customer("REWARDED") }
  let!(:regular_customer) { make_customer("REGULAR") }

  it "returns corresponding rates when filter matched" do
    weekend = make_date("2014-6-14")
    rates = policy.apply(rewarded_customer, weekend)
    expect(rates.value).to eql(100)
    
    weekday = make_date("2014-6-12")
    rates = policy.apply(regular_customer, weekday)
    expect(rates.value).to eql(170)
  end

  it "raises exception when no filter is applicable" do
    policy = HotelReservation::RatesPolicy.new
    expect { policy.apply(rewarded_customer, nil) }.to raise_error(HotelReservation::RatesPolicy::NoFilterApplicableError)
  end

end

