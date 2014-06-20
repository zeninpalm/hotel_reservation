module HotelReservation
  class SumRatesUseCase
    def executes(request)
      dates = request.dates
      user = request.user
      policy = request.rates_policy
      sum = request.initial.dup

      dates.each do |date|
        sum.value += policy.apply(user, date).value
      end
      sum
    end
  end
end
