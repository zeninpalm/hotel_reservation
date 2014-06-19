module HotelReservation
  class ApplicabilityFilterFactory 
    def self.make(rewarded: false, weekend: false)
      ApplicabilityFilter.new do |user, date|
        (rewarded ? (user.rewarded?) : (not user.rewarded?)) and
         (weekend ? (date.weekend?) : (not date.weekend?))
      end
    end
  end
end

