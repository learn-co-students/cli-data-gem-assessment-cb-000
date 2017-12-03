class NowPlaying::CLI

  def call
    puts "Your Path to Hollywood:"
    list_movies
    menu
  end

  def list_movies
    puts <<-DOC.gsub /^\s*/, ''
      Rocky
      All The Presidents Men
      Pirates of the Caribbean
      Rush
      Alfie
      The Pink Panther
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the title of the film you're looking for or type movies for more titles or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Title of movie 1..."
      when "2"
        puts "Title of movie 2..."
      when "movies"
        list_movies
      else
        puts "What are you looking for this evening?"
      end
  end
end

  def goodbye
    puts "See you at the movies!"
  end

end
