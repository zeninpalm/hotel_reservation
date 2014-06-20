module HotelReservation
  class RatesPolicy
    def initialize
      @entries = []
    end

    def add_entry(filter, rates)
      @entries << [filter, rates]
    end

    def apply(user, date)
      @entries.each do |entry|
        if entry[0].matched?(user, date)
          return entry[1]
        end
      end
      raise NoFilterApplicableError
    end

    class NoFilterApplicableError < RuntimeError
    end
  end
end

