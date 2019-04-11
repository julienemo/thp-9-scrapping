require_relative '../lib/02_cher_depute'

describe "get_all_mails method" do
  it "takes the list url and returns an array of hashes containing the personal info
  the list should have more than 200 items and the contact info should contain @" do
    result = get_all_mails("http://www2.assemblee-nationale.fr/deputes/liste/tableau")
    expect(result.length).to be > (200)
    expect(result[6]['contact'][0]).to include('@')
  end
end
