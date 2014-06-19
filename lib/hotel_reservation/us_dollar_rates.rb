module HotelReservation
  class Rates
    def initialize(&block)
      @filter = block
    end

    def applicable?(user, date)
      @filter.call(user, date)
    end
  end
end

