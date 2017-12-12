require "open-uri"
require "nokogiri"

search_url = "https://philadelphia.craigslist.org/search/sss?query=oneplus" #Temp only
class CraigslistScraper
  def self.scrape_search_page(search_url)
    html = open(search_url)
    search = Nokogiri::HTML(html)
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
