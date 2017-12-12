require_relative "../lib/craigslist_scraper.rb"
require_relative "../lib/listing.rb"
require "cgi"
require "colorize"

class CommandLineInteface

  def run
    city = ""
    puts "\n\nWelcome to Craigslist Search!\n\n"
    until ["philadelphia", "chicago", "newyork", "houston", "losangeles"].detect {|loc| loc == city} do
      puts "\n\nWhat city do you want to search (try: Philadelphia, Chicago, or NewYork)\n"
      city = gets.strip.gsub(/\s+/,"").downcase
    end
    puts "\n\nPlease enter the item for which you would like to search. (e.g. Laptop, bike, or sofa)\n"
    item = CGI.escape(gets.strip)
    search_url = "https://#{city}.craigslist.org/search/sss?query=#{item}"
    make_listings(search_url)
    add_details_to_listings
    display_listings
  end

  def make_listings(search_url)
    listings_array = CraigslistScraper.scrape_search_page(search_url)
    Listing.create_from_collection(listings_array)
  end

  def add_details_to_listings
    Listing.all.each do |listing|
      details = CraigslistScraper.scrape_listing_page(listing.listing_url)
      listing.add_details(details)
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
