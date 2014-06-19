module HotelReservation
  class FindHotelRequest
    attr_accessor :user, :dates, :hotels
    
    def initialize(user, dates, hotels)
      @user = user
      @dates = dates
      @hotels = hotels
    end
  end
end
