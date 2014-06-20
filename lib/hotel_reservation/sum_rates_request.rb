module HotelReservation
  class SumRatesRequest
    attr_accessor :user, :dates, :rates_policy, :initial

    def initialize(user, dates, policy, initial)
      @user = user
      @dates = dates
      @rates_policy = policy 
      @initial = initial
    end
  end
end

