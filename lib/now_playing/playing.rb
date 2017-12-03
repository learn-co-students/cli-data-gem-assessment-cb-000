class NowPlaying::Playing

  def self.today
    # Will pull movies playing today
    puts <<-DOC.gsub /^\s*/, ''
      Rocky
      All The Presidents Men
      Pirates of the Caribbean
      Rush
      Alfie
      The Pink Panther
    DOC
    movie_1 = Movie.new
    movie_1.name = "Rocky"
    movie_1
  end
end
