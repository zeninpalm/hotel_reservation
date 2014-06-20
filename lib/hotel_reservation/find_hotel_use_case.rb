module HotelReservation
  class FindHotelUseCase
    def executes(request)
      @cheapest = nil
      extract_values(request)
      @hotels.each do |hotel|
        sum = sum_rates(hotel)
        set_cheapest(sum, hotel)
      end
      @cheapest
    end

    private
    def extract_values(request)
      @user = request.user
      @dates = request.dates
      @hotels = request.hotels
      @initial = request.initial
    end

    def sum_rates(hotel)
      sum_rates_request = HotelReservation::SumRatesRequest.new(@user, @dates, hotel.rates_policy, @initial)
      sum_rates_use_case = HotelReservation::SumRatesUseCase.new
      sum_rates_use_case.executes(sum_rates_request)
    end

    def set_cheapest(sum, hotel)
      if @cheapest.nil?
        @cheapest = [sum, hotel]
      elsif @cheapest[0] > sum
        @cheapest = [sum, hotel]
      elsif @cheapest[0] == sum
        if @cheapest[1].rating < hotel.rating
          @cheapest = [sum, hotel]
        end
      end
    end
  end
end

