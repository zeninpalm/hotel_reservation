module HotelReservation
  class FindHotelUseCase
    def executes(request)
      user = request.user
      dates = request.dates
      hotels = request.hotels
      initial = request.initial
      cheapest = nil

      hotels.each do |hotel|
        sum_rates_request = HotelReservation::SumRatesRequest.new(user, dates, hotel.rates_policy, initial)
        sum_rates_use_case = HotelReservation::SumRatesUseCase.new
        sum = sum_rates_use_case.executes(sum_rates_request)

        if cheapest.nil?
          cheapest = [sum, hotel]
        elsif cheapest[0] > sum
          cheapest = [sum, hotel]
        elsif cheapest[0] == sum
          if cheapest[1].rating < hotel.rating
            cheapest = [sum, hotel]
          end
        end
      end
      cheapest
    end
  end
end

