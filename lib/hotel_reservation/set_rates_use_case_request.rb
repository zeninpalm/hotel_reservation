module HotelReservation
  class SetRatesUseCaseRequest
    attr_accessor :hotel, :rates_policy

    def initialize(hotel, rates_policy)
      @hotel = hotel
      @rates_policy = rates_policy
    end
  end
end

