module Helpers
  def make_namer(name='First Hotel')
    HotelReservation::Namer.new(name)
  end

  def make_ratinger(rank=3)
    HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(rank))
  end

  def make_hotel(name, rating)
    namer = make_namer(name)
    ratinger = make_ratinger(rating)
    HotelReservation::Hotel.build(namer, ratinger)
  end

  def make_rates_policy(rates_1, rates_2, rates_3, rates_4)
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)

    rates1 = HotelReservation::USDollarRates.new(rates_1)
    rates2 = HotelReservation::USDollarRates.new(rates_2)
    rates3 = HotelReservation::USDollarRates.new(rates_3)
    rates4 = HotelReservation::USDollarRates.new(rates_4)

    policy.add_entry(rewarded_weekend, rates_1)
    policy.add_entry(rewarded_weekday, rates_2)
    policy.add_entry(regular_weekend, rates_3)
    policy.add_entry(regular_weekday, rates_4)

    policy
  end
  
  def make_customer(type)
    if type == "REWARDS"
      HotelReservation::RewardedCustomer.new
    elsif type == "REGULAR"
      HotelReservation::RegularCustomer.new
    end
  end

  def make_date(date_str)
    HotelReservation::HotelDate.parse(date_str)
  end

  def make_sum_rates_request(customer, dates, policy, initial)
    HotelReservation::SumRatesRequest.new(
      customer, dates, policy, initial
    )
  end

  def make_sum_rates_use_case
    HotelReservation::SumRatesUseCase.new
  end

  def us_dollar(v)
    HotelReservation::USDollarRates.new(v)
  end

  def make_set_rates_request(hotel, policy)
    HotelReservation::SetRatesUseCaseRequest.new(hotel, policy)
  end

  def make_set_rates_use_case
    HotelReservation::SetRatesUseCase.new
  end

  def make_find_hotel_request(customer, dates, hotels, initial)
    HotelReservation::FindHotelRequest.new(customer, dates, hotels, initial)
  end

  def make_find_hotel_use_case
    HotelReservation::FindHotelUseCase.new
  end
end

