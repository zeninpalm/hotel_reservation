require 'spec_helper'

describe HotelReservation::SetUseCase do
  let(:use_case) { HotelReservation::SetUseCase.new }
  it "has executes interface" do
    use_case.executes(Object.new)
  end
end

