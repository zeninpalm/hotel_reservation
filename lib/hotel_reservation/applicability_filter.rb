module HotelReservation
  class ApplicabilityFilter
    def initialize(&block)
      @filter = block
    end

    def matched?(user, date)
      @filter.call(user, date)
    end
  end
end

