require_relative '../lib/00_dark_trader'
require "nokogiri"
require "open-uri"


describe "the only method" do
  it "goes to coinmarketcap and returns a list with more than 1000 results, and there is a result for BCT, with is a number" do
    result = get_price_list
    expect(result.length).to be > (1000)

  end
end
