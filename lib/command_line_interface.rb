require_relative "../lib/craigslist_scraper.rb"
require_relative "../lib/listing.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInteface
  search_url = "https://philadelphia.craigslist.org/search/sss?query=hp+laptop+8gb&max_price=750" #Only Temporary

  def run
    make_listings
    add_details_to_listings
    display_listings
  end

  def make_listings
    listings_array = CraigslistScraper.scrape_search_page(search_url)
    Student.create_from_collection(listings_array)
  end

  def add_details_to_listings
    Listing.all.each do |listing|
      details = CraiglistScraper.scrape_listing_page(listing_url)
      listing.add_details(attributes)
    end
  end

  def display_listings
    Listing.all.each do |listing|
      puts "#{listing.listing_url}".colorize(:blue)
      puts "  title:".colorize(:light_blue) + " #{listing.title}"
      puts "  price:".colorize(:light_blue) + " #{listing.price}"
      puts "  location:".colorize(:light_blue) + " #{listing.location}"
      puts "  description:".colorize(:light_blue) + " #{listing.description}"
      puts "----------------------".colorize(:green)
    end
  end

end
