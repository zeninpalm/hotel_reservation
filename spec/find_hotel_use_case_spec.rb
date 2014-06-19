require 'spec_helper'

describe HotelReservation::FindHotelUseCase do
  it "returns the cheapest hotel" do
    regular_user = HotelReservation::RegularCustomerFactory.make
    weekend = HotelReservation::HotelDate.parse("2014-6-14")
    another_weekend = HotelReservation::HotelDate.parse("2014-6-15")
    weekday = HotelReservation::HotelDate.parse("2014-6-16")
    dates = [weekend, another_weekend, weekday]

    namer = HotelReservation::Namer.new("First Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_0 = HotelReservation::USDollarRates.new(0)
    policy.add_entry(rewarded_weekend, rates_0)
    policy.add_entry(rewarded_weekday, rates_0)
    policy.add_entry(regular_weekend, rates_0)
    policy.add_entry(regular_weekday, rates_0)
    r = HotelReservation::SetRatesUseCaseRequest.new(hotel, policy)
    use_case.executes(r)

    namer = HotelReservation::Namer.new("Second Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    second_hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_1 = HotelReservation::USDollarRates.new(1)
    policy.add_entry(rewarded_weekend, rates_1)
    policy.add_entry(rewarded_weekday, rates_1)
    policy.add_entry(regular_weekend, rates_1)
    policy.add_entry(regular_weekday, rates_1)
    r = HotelReservation::SetRatesUseCaseRequest.new(second_hotel, policy)
    use_case.executes(r)

    namer = HotelReservation::Namer.new("Third Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    third_hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_2 = HotelReservation::USDollarRates.new(2)
    policy.add_entry(rewarded_weekend, rates_2)
    policy.add_entry(rewarded_weekday, rates_2)
    policy.add_entry(regular_weekend, rates_2)
    policy.add_entry(regular_weekday, rates_2)
    r = HotelReservation::SetRatesUseCaseRequest.new(third_hotel, policy)
    use_case.executes(r)
    hotels = [hotel, second_hotel, third_hotel]

    find_request = HotelReservation::FindHotelRequest.new(regular_user, dates, hotels)
    find_use_case = HotelReservation::FindHotelUseCase.new
    cheapest = find_use_case.executes(find_request)
    expect(cheapest).to eql([0, hotel])
  end
  it "returns the highest rating hotel" do
    regular_user = HotelReservation::RegularCustomerFactory.make
    weekend = HotelReservation::HotelDate.parse("2014-6-14")
    another_weekend = HotelReservation::HotelDate.parse("2014-6-15")
    weekday = HotelReservation::HotelDate.parse("2014-6-16")
    dates = [weekend, another_weekend, weekday]

    namer = HotelReservation::Namer.new("First Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_0 = HotelReservation::USDollarRates.new(0)
    policy.add_entry(rewarded_weekend, rates_0)
    policy.add_entry(rewarded_weekday, rates_0)
    policy.add_entry(regular_weekend, rates_0)
    policy.add_entry(regular_weekday, rates_0)
    r = HotelReservation::SetRatesUseCaseRequest.new(hotel, policy)
    use_case.executes(r)

    namer = HotelReservation::Namer.new("Second Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(4))
    second_hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    policy.add_entry(rewarded_weekend, rates_0)
    policy.add_entry(rewarded_weekday, rates_0)
    policy.add_entry(regular_weekend, rates_0)
    policy.add_entry(regular_weekday, rates_0)
    r = HotelReservation::SetRatesUseCaseRequest.new(second_hotel, policy)
    use_case.executes(r)

    namer = HotelReservation::Namer.new("Third Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(5))
    third_hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    policy.add_entry(rewarded_weekend, rates_0)
    policy.add_entry(rewarded_weekday, rates_0)
    policy.add_entry(regular_weekend, rates_0)
    policy.add_entry(regular_weekday, rates_0)
    r = HotelReservation::SetRatesUseCaseRequest.new(third_hotel, policy)
    use_case.executes(r)
    hotels = [hotel, second_hotel, third_hotel]

    find_request = HotelReservation::FindHotelRequest.new(regular_user, dates, hotels)
    find_use_case = HotelReservation::FindHotelUseCase.new
    cheapest = find_use_case.executes(find_request)
    expect(cheapest).to eql([0, third_hotel])
  end
  it "returns the cheapest hotel in different order" do
    regular_user = HotelReservation::RegularCustomerFactory.make
    weekend = HotelReservation::HotelDate.parse("2014-6-14")
    another_weekend = HotelReservation::HotelDate.parse("2014-6-15")
    weekday = HotelReservation::HotelDate.parse("2014-6-16")
    dates = [weekend, another_weekend, weekday]

    namer = HotelReservation::Namer.new("First Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_1 = HotelReservation::USDollarRates.new(1)
    policy.add_entry(rewarded_weekend, rates_1)
    policy.add_entry(rewarded_weekday, rates_1)
    policy.add_entry(regular_weekend, rates_1)
    policy.add_entry(regular_weekday, rates_1)
    r = HotelReservation::SetRatesUseCaseRequest.new(hotel, policy)
    use_case.executes(r)

    namer = HotelReservation::Namer.new("Second Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    second_hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_1 = HotelReservation::USDollarRates.new(1)
    policy.add_entry(rewarded_weekend, rates_1)
    policy.add_entry(rewarded_weekday, rates_1)
    policy.add_entry(regular_weekend, rates_1)
    policy.add_entry(regular_weekday, rates_1)
    r = HotelReservation::SetRatesUseCaseRequest.new(second_hotel, policy)
    use_case.executes(r)

    namer = HotelReservation::Namer.new("Third Hotel")
    ratinger = HotelReservation::Ratinger.new(HotelReservation::IntegerRank.new(3))
    third_hotel = HotelReservation::Hotel.build(namer, ratinger)
    use_case = HotelReservation::SetRatesUseCase.new
    policy = HotelReservation::RatesPolicy.new
    rewarded_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: true)
    rewarded_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: true, weekend: false)
    regular_weekday = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: false)
    regular_weekend = HotelReservation::ApplicabilityFilterFactory.make(rewarded: false, weekend: true)
    rates_0 = HotelReservation::USDollarRates.new(0)
    policy.add_entry(rewarded_weekend, rates_0)
    policy.add_entry(rewarded_weekday, rates_0)
    policy.add_entry(regular_weekend, rates_0)
    policy.add_entry(regular_weekday, rates_0)
    r = HotelReservation::SetRatesUseCaseRequest.new(third_hotel, policy)
    use_case.executes(r)
    hotels = [hotel, second_hotel, third_hotel]

    find_request = HotelReservation::FindHotelRequest.new(regular_user, dates, hotels)
    find_use_case = HotelReservation::FindHotelUseCase.new
    cheapest = find_use_case.executes(find_request)
    expect(cheapest).to eql([0, third_hotel])
  end

end
