require "pry"
require "nokogiri"
require "open-uri"

# getting the really interesting part of the page
# there is reading to do before we got here
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

price_list = []

page.xpath('//tbody/tr').each_with_index do |crypto,i|
  # this is the currency code
  currency = crypto.xpath('td[@class="text-left col-symbol"]').text
  # this is the price, chopped off the dollar sign
  # and transferred to float
  price = crypto.xpath('td[@class="no-wrap text-right"]').text.delete("$").to_f
  # and we put the hash into a list
  price_list[i] = {currency => price}
end
puts price_list
