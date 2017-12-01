require 'nokogiri'
require 'open-uri'
require 'pry'


class CraigslistScraper
  def self.scrape_search_page(search_url)
    html = open(search_url)
    search = Nokogiri::HTML(html)
# search.css("li.result-row time").attribute("datetime").value #date/time
# search.css("li.result-row a.result-image").first.text.strip #price
# search.css("li.result-row a.result-title").first.text.strip #title
# search.css("li.result-row span.result-meta span.result-hood").first.text.strip #location
    @@listings = []
    search.css("li.result-row").map {|listing| {:listing_url => listing.css("a").attribute("href").value}}
  end



  def self.scrape_listing_page(listing_url)
    html2 = open(listing_url)
    listing = Nokogiri::HTML(html2)
    {
     :title => listing.css("h2.postingtitle #titletextonly").text, #title
     :price => listing.css("h2.postingtitle .price").text, #price
     :location => listing.css("h2.postingtitle small").text.strip, #location
     :description => listing.css("#postingbody").text.strip #Description
    }
  end

end
