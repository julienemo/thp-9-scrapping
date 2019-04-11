require_relative '../lib/02_cher_depute'


describe "personal_info method" do
  it "takes a personal url and returns a hash of first name, family name and contact" do
    expect(personal_info("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720870")['contact']).not_to eq(nil)
  end
end

describe "get_personal_url method" do
  it "takes the list url and returns an array of urls to get to each deputy's personal page" do
    expect(personal_info("http://www2.assemblee-nationale.fr/deputes/liste/tableau").length).to be > (100)
  end
end

describe "get_all_mails method" do
  it "takes the list url and returns an array of hashes containing the personal info" do
    expect(get_all_mails("http://www2.assemblee-nationale.fr/deputes/liste/tableau").length).to be > (100)
  end
end
