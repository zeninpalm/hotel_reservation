module HotelReservation
  class SumRatesRequest
    attr_accessor :user, :dates, :rates_policy

    def initialize(user, dates, policy)
      @user = user
      @dates = dates
      @rates_policy = policy 
    end
  end
end

