require_relative '../lib/01_mairie_christ'


describe "get_townhall_email method" do

  it "takes a city hall link and gets the email" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to include("@")
  end

end

describe "get_townhall_urls method" do

  it "takes an annuaire link and returns a list of links of all cities on this page" do
    expect(get_townhall_urls("https://www.annuaire-des-mairies.com/95/avernes.html").length)not_to eq(@)
  end

end

describe "get_all_emails method" do

  it "takes an annuaire link and returns a list of emails of all cities on this page" do
    expect(get_all_emails("https://www.annuaire-des-mairies.com/95/avernes.html").to include("@")
  end

end
