class Artist
  def initialize(name="unknown", birth_year=-1, death_year=-1)
    @name = name
    @birth_year = birth_year
    @death_year = death_year
  end

  def print_info
    if @birth_year >= 0 && @death_year >= 0
      puts "Artist: #{@name} (#{@birth_year} to #{@death_year})"
    elsif @birth_year >= 0
      puts "Artist: #{@name} (#{@birth_year} to present)"
    else
      puts "Artist: #{@name} (unknown)"
    end
  end
end

class Artwork
  def initialize(title="unknown", year_created=-1, artist=Artist.new)
    @title = title
    @year_created = year_created
    @artist = artist
  end

  def print_info
    @artist.print_info
    puts "Title: #{@title}, #{@year_created}"
  end
end

if __FILE__ == $PROGRAM_NAME
  print "Enter artist name: "
  user_artist_name = gets.chomp
  print "Enter artist birth year: "
  user_birth_year = gets.chomp.to_i
  print "Enter artist death year: "
  user_death_year = gets.chomp.to_i
  print "Enter artwork title: "
  user_title = gets.chomp
  print "Enter year artwork was created: "
  user_year_created = gets.chomp.to_i

  user_artist = Artist.new(user_artist_name, user_birth_year, user_death_year)
  new_artwork = Artwork.new(user_title, user_year_created, user_artist)

  new_artwork.print_info
end
