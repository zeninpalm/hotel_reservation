require "./lib/hotel_reservation/version"

Gem::Specification.new do |s|
  s.name = "hotel_reservation"
  s.version = HotelReservation::VERSION
  #s.executables << 'hotel_'
  s.platform = Gem::Platform::RUBY
  s.authors = ["Yi Wei"]
  s.email = ["yiwei.in.cyber@gmail.com"]
  s.summary = "Hotel Reservation"
  s.description = s.summary
  s.files = Dir.glob("lib/**/*") + %w(README.md LICENSE Rakefile)
  s.require_path = "lib"
end

