# I'm designing this around the IMDB site, so I can pull movie info by name (title),
# times, locations, and other data that will help users make an informed decision
require 'nokogiri'
require 'open-uri'

class NowPlaying::Playing

    def self.today
      # starts a scrape to return info for new movies playing in local theaters
      self.scrape_movies
    end

    def self.scrape_movies
      # go to Fandango
      # scrape movie info from their website
      # instantiate a return that shows info for chosen movie
      movies = []
      movies << self.scrape_imdb
      movies
    end

    def self.scrape_imdb
      doc = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1"))
      binding.pry
    end

    def get_scrape_imdb
      self.scrape_imdb.css(".post")
    end

    def make_info_imdb
      self.get_scrape_imdb.each do |post|
        movie = Movie.new
        movie.name = post.css("td.overview-top h4 a").text
        movie.theater = post.css("").text
        movie.url = post.css("").text
        movie.summary = post.css("").text
      end
    end

    def print_scrape_imdb
      self.make_info_imdb
      Movie.all.each do |movie|
        puts "Name: #{movie.name}"
        puts "Theater: #{movie.theater}"
        puts "URL: #{movie.url}"
        puts "Summary: #{movie.summary}"
      end
    end
  end
end
