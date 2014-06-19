module HotelReservation
  class SetRatesUseCase

    def executes(request)
      request.hotel.rates_policy = request.rates_policy
    end
  end
end
  
