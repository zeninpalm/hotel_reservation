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
          return entry[1].value
        end
      end
    end
  end
end

