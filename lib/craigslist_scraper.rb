require 'nokogiri'
require 'open-uri'
require 'pry'

search_url = "https://philadelphia.craigslist.org/search/sss?query=hp+laptop+8gb&max_price=750" #Only Temporary

class CraigslistScraper
  def self.scrape_search_page(search_url)
    html = open(search_url)
    listings = Nokogiri::HTML(html)
# listings.css("li.result-row time").attribute("datetime").value #date/time
# listings.css("li.result-row a.result-image").first.text.strip #price
# listings.css("li.result-row a.result-title").first.text.strip #title
# listings.css("li.result-row span.result-meta span.result-hood").first.text.strip #location
    listing_url = listings.css("li.result-row a").attribute("href").value
  end



  def self.scrape_listing_page(listing_url)
    html2 = open(listing_url)
    listing = Nokogiri::HTML(html2)
# listing.css("h2.postingtitle #titletextonly").text #title
# listing.css("h2.postingtitle .price").text #price
# listing.css("h2.postingtitle small").text.strip #location
# listing.css("#postingbody").text.strip #Description

  end

end
