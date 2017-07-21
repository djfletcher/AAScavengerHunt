require 'httparty'
require 'nokogiri'

def crawl(url)
 page = HTTParty.get(url)
 doc = Nokogiri::HTML(page)
 doc.css('a').map.with_index do |a, index|
   address = a['href']
   response = HTTParty.get(address)
   p address
   if response.code == 200
     crawl(address)
     valid_links << address
   end
 end
end

crawl('https://scottduane.github.io/TopSecretClue/')
