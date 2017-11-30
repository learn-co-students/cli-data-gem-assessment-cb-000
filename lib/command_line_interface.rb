require_relative "../lib/scraper.rb"
require_relative "../lib/student.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInteface

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
      puts "#{listing.title}".colorize(:blue)
    end
  end

end
