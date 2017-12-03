class NowPlaying::CLI

  def call
    puts "Your Path to Hollywood:"
    list_movies
    menu
  end

  def list_movies
    puts <<-DOC.gsub /^\s*/, ''
      All the movies you want to see are listed here.
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the title of the film you're looking for or type exit to enter:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Title of movie 1..."
      when "2"
        puts "Title of movie 2..."
      end
  end
end

  def goodbye
    puts "See you at the movies!"
  end

end
