require 'spec_helper'

describe HotelReservation::SetRatesUseCase do
  let(:use_case) { HotelReservation::SetRatesUseCase.new }
  it "has executes interface" do
    use_case.executes(Object.new)
  end
end

