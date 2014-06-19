module HotelReservation
  class SumRatesUseCase
    def executes(request)
      dates = request.dates
      user = request.user
      policy = request.rates_policy
      sum = 0

      dates.each do |date|
        sum += policy.apply(user, date).value
      end
      sum
    end
  end
end
