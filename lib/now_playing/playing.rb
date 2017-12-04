# I'm designing this around the IMDB site, so I can pull movie info by name (title),
# times, locations, and other data that will help users make an informed decision

class NowPlaying::Playing
  attr_accessor :title, :url, :summary

  def initialize(title = nil, url = nil)
    @title = title
    @url = url
  end

    def self.all
      @@all ||= scrape_movies
    end

    def self.find(id)
      self.all[id-1]
    end

    def self.find_by_title(title)
    self.all.detect do |m|
      m.title.downcase.strip == title.downcase.strip ||
      m.title.split("(").first.strip.downcase == title.downcase.strip
    end
  end

    def summary
      @summary ||= plot_summary_doc.search("p.plotSummary").text.strip
    end

    private
      def self.scrape_imdb
        doc = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1"))

        movie = self.new
        movie.title = doc.search("div.list_item.odd h4").first.text
        movie.url = doc.search("div.list_item.odd a").first.attr("href")
        movie.summary = doc.search("div.outline").first.text
        movie
      end
    end
