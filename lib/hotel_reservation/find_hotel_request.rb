module HotelReservation
  class FindHotelRequest
    attr_accessor :user, :dates, :hotels, :initial
    
    def initialize(user, dates, hotels, initial)
      @user = user
      @dates = dates
      @hotels = hotels
      @initial = initial
    end
  end
end
