module HotelReservation
  class HotelDate < Date
    def weekend?
      self.friday? or self.saturday? or self.sunday?
    end
  end
end

