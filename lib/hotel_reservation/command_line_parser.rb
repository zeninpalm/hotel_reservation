module HotelReservation
  class CommandLineParser
    def initialize
      @customer_type = "REGULAR"
      @dates = []
    end

    def parse(cmd_line)
      type, *dates = cmd_line.split(/:|,/)
      @customer_type = type.lstrip.rstrip
      check_customer_type_legality!
      check_dates_legality!(dates)
      self.dates = dates
    end

    def customer_type
      @customer_type.upcase
    end

    def dates=(dates)
      @dates = []
      dates.each do |date|
        @dates << HotelReservation::HotelDate.parse(date)
      end
    end

    def dates
      @dates
    end

    private

    def check_customer_type_legality!
      if self.customer_type != 'REGULAR' and self.customer_type != 'REWARDS'
        raise RuntimeError, "Illegal customer Type"
      end
    end

    def check_dates_legality!(dates)
      dates.each do |date|
        HotelReservation::HotelDate.parse(date)
      end
    rescue
      raise RuntimeError, "Illegal date"
    end
  end
end
