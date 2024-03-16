require 'rspec'

class Artist
  attr_reader :name, :birth_year, :death_year

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
  attr_reader :title, :year_created, :artist

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

RSpec.describe Artist do
  describe "#initialize" do
    it "sets default values when no arguments are provided" do
      artist = Artist.new
      expect(artist.name).to eq("unknown")
      expect(artist.birth_year).to eq(-1)
      expect(artist.death_year).to eq(-1)
    end

    it "sets provided values when arguments are provided" do
      artist = Artist.new("Vincent van Gogh", 1853, 1890)
      expect(artist.name).to eq("Vincent van Gogh")
      expect(artist.birth_year).to eq(1853)
      expect(artist.death_year).to eq(1890)
    end
  end

  describe "#print_info" do
    it "prints artist information" do
      artist = Artist.new("Leonardo da Vinci", 1452, 1519)
      expect { artist.print_info }.to output("Artist: Leonardo da Vinci (1452 to 1519)\n").to_stdout
    end
  end
end

RSpec.describe Artwork do
  describe "#initialize" do
    it "sets default values when no arguments are provided" do
      artwork = Artwork.new
      expect(artwork.title).to eq("unknown")
      expect(artwork.year_created).to eq(-1)
      expect(artwork.artist.name).to eq("unknown")
      expect(artwork.artist.birth_year).to eq(-1)
      expect(artwork.artist.death_year).to eq(-1)
    end

    it "sets provided values when arguments are provided" do
      artist = Artist.new("Pablo Picasso", 1881, 1973)
      artwork = Artwork.new("Guernica", 1937, artist)
      expect(artwork.title).to eq("Guernica")
      expect(artwork.year_created).to eq(1937)
      expect(artwork.artist.name).to eq("Pablo Picasso")
      expect(artwork.artist.birth_year).to eq(1881)
      expect(artwork.artist.death_year).to eq(1973)
    end
  end

  describe "#print_info" do
    it "prints artwork information" do
      artist = Artist.new("Leonardo da Vinci", 1452, 1519)
      artwork = Artwork.new("Mona Lisa", 1503, artist)
      expect { artwork.print_info }.to output("Artist: Leonardo da Vinci (1452 to 1519)\nTitle: Mona Lisa, 1503\n").to_stdout
    end
  end
end
