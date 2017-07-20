require 'httparty'
require 'nokogiri'

page = HTTParty.get('https://scottduane.github.io/TopSecretClue/')
doc = Nokogiri::HTML(page)
links = doc.css('a')
valid_links = []




links.each do |a|
  address = a['href']
  response = HTTParty.get(address)
  if response.code == 200
    valid_links << address

  end
end

def parse_page(page)
  doc = Nokogiri::HTML(page)
  links = doc.css('a')
  
end

def follow_link(url, valid_links)
  response = HTTParty.get(url)
  if response.code == 200
    valid_links << url
    follow_link()
  end
end

# doc.css('a')[2000..-1].map.with_index do |a, index|
#   address = a['href']
#   if index % 1000 == 0
#    puts index
#   end
#   response = HTTParty.get(address)
#   if response.code == 200
#     valid_links << address
#   end
# end

p valid_links
