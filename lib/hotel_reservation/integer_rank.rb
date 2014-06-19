module HotelReservation
  class IntegerRank
    attr_accessor :value

    def initialize(value)
      @value = value.to_int
    end
  end
end
