class Student

  attr_accessor :title, :price, :location, :listing_url, :description

  @@all = []

  def initialize(listing_hash)
    listing_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(listings_array)
    listings_array.each {|listing| Listing.new(listing)}
  end

  def add_listing_details(details_hash)
    details_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end
end
