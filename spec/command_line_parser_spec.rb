require 'spec_helper'

describe HotelReservation::CommandLineParser do
	let!(:parser) { HotelReservation::CommandLineParser.new }

	it "rejects illegal input" do
    input =  "Sometype:1, 2, 3"
		expect { parser.parse(input) }.to raise_error
    expect { parser.parse("Regular: 5, 4, 6") }.to raise_error
	end

  context "legal input" do
    let!(:input) { "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)" }
    let!(:dates) { [make_date("16Mar2009(mon)"), make_date("17Mar2009(tues)"), make_date("18Mar2009(wed)")] }

    it "parses customer type" do
      parser.parse(input)
      expect(parser.customer_type).to eql('REGULAR')
    end

    it "parses dates" do
      parser.parse(input)
      expect(parser.dates).to eql(dates)
    end
  end
end