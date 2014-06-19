module HotelReservation
  class Hotel
    private_class_method :new

    def self.build(namer, ratinger)
      new(namer, ratinger)
    end

    def initialize(namer, ratinger)
      @namer = namer
      @ratinger = ratinger
    end

    def name
      @namer.name
    end

    def name=(v)
      @namer.name = v
    end

    def rating
      @ratinger.rating
    end

    def rating=(v)
      @ratinger.rating = v
    end
  end
end

