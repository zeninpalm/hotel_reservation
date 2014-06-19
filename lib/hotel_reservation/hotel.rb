module HotelReservation
  class Hotel
    private_class_method :new

    def self.build(namer, ratinger)
      new(namer, ratinger)
    end

    def initialize(namer, ratinger)
    end
  end
end

