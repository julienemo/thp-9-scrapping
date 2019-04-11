require_relative '../lib/01_mairie_christ'


describe "get_townhall_email method" do

  it "takes a city hall link and gets the email" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to include("@")
  end

end

describe "get_townhall_urls method" do
  it "takes an annuaire link and returns a list of links of all cities on this page,
  the list has more than 10 items" do
  result1 = get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")
    expect(result1.length).to be > (10)

  end
end

describe "get_all_emails method" do

  it "takes an annuaire link and returns a list of emails of all cities on this page
  the list should have more than 10 items and a chosen one contains @" do
    result2 = get_all_emails("https://www.annuaire-des-mairies.com/val-d-oise.html")
    expect(result2.length).to be > (10)
    # would like to do result1.length = result2.length
    # but you know, local....
    expect(result2[6]).to include("@")
  end

end
