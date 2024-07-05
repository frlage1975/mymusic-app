require 'faker'

# Clear existing data
Country.destroy_all
Category.destroy_all
Artist.destroy_all
Album.destroy_all
Song.destroy_all

# Populate countries from API
Rake::Task['db:populate_countries'].invoke

# Seed Categories
10.times do
  Category.create(name: Faker::Music.unique.genre)
end

# Seed Artists, Albums, and Songs
50.times do
  country = Country.order('RANDOM()').first
  artist = Artist.create(name: Faker::Music.band, country: country)

  rand(1..3).times do
    category = Category.order('RANDOM()').first
    album = Album.create(title: Faker::Music.album, category: category, image: Faker::LoremFlickr.image(size: "300x300", search_terms: ['music', Faker::Number.rand(1..100).to_s]))
    artist.albums << album

    rand(8..10).times do
      song = Song.create(title: Faker::Music::RockBand.song)
      album.songs << song
    end
  end
end

# Seed additional artist-album and album-song relationships for many-to-many connections
10.times do
  album = Album.order('RANDOM()').first
  artist = Artist.order('RANDOM()').first
  album.artists << artist unless album.artists.include?(artist)
end

10.times do
  album = Album.order('RANDOM()').first
  song = Song.order('RANDOM()').first
  album.songs << song unless album.songs.include?(song)
end
