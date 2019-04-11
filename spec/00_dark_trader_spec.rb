require_relative '../lib/00_dark_trader'
require "nokogiri"
require "open-uri"


describe "the only method" do
  it "goes to coinmarketcap and returns a list" do
    expect((get_price_list).length).not_to eq(0)
  end
end
