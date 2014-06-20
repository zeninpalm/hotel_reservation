require 'spec_helper'

describe HotelReservation::SumRatesUseCase do
  let!(:initial) { initial = us_dollar(0) }
  let!(:policy) { make_rates_policy(us_dollar(100), us_dollar(190), us_dollar(320), us_dollar(170)) }

  it "has executes inteface accepting SumRatesRequest" do
    regular_customer = make_customer("REGULAR")
    weekend = make_date("2014-6-14") 
    next_weekend = make_date("2014-6-15") 
    weekday = make_date("2014-6-16") 

    sum_rates_request = make_sum_rates_request(
      regular_customer, [weekend, next_weekend, weekday], policy, initial)
    sum_rates_use_case = make_sum_rates_use_case
    sum = sum_rates_use_case.executes(sum_rates_request)

    expect(sum.value).to eq(us_dollar(810).value)
  end
end

