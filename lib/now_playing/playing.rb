class NowPlaying::Playing

  def self.today
    # Will pull movies playing today
    puts <<-DOC.gsub /^\s*/, ''
      Coco
      Wonder
      Justice League
      Thor: Ragnarok
      Wind River
      The Disaster Artist
    DOC
    movie_1 = Movie.new
    movie_1.name = "Rocky"
    movie_1.theater = "Metro Four"
    movie_1.url = "https://www.fandango.com/coco-2017-185799/movie-overview"
  end
end
