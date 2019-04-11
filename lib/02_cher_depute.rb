require "pry"
require "nokogiri"
require "open-uri"

def personal_info(deputy_page)
  # basic settings
  page = Nokogiri::HTML(open(deputy_page))
  info = {}
  personal_mails = []

  # getting emails by pure xpath, no pain at all
  # just that some has more than one
  # I'll put them in a list
  personal_mails << page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
  other_mail = page.xpath('//*[@id="hcard-Damien-Abad"]/dd[3]/a').text
  unless other_mail == ""
    personal_mails << other_mail
  end
  info['contact'] = personal_mails

  # getting name info
  identity = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text
  id_array = identity.split(' ')
  id_array = id_array[1..-1]
  info['first_name'] = id_array[0..-2].join(" ")
  info['last_name'] = id_array[-1]
  return info
end


def get_personal_url(annuaire_url)
  page = Nokogiri::HTML(open(annuaire_url))
  url_list = []

  prefix = annuaire_url.split('/')[0..-4].join('/')
  page.xpath('//body//td/a').each do |item|
    url_list << "#{prefix}#{item['href']}"
  end
  url_list
end

def get_all_mails(annuaire_url)
  mail_list = []
  page = Nokogiri::HTML(open(annuaire_url))
  links = get_personal_url(annuaire_url)

  i = 0
  while i < links.length do
    mail_list << personal_info(links[i])
    i += 1
  end
  p mail_list


end
#personal_info("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720870")
get_all_mails("http://www2.assemblee-nationale.fr/deputes/liste/tableau")

#puts get_personal_url("http://www2.assemblee-nationale.fr/deputes/liste/tableau")
=begin

links.each do |link|
  puts personal_info(link)
end
return mail_list
=end
