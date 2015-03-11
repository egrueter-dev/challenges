require 'csv'
require 'pry'

class Album
  def initialize(album_id, album_title, track_artists)
    @album_id = album_id
    @album_title = album_title
    @track_artists = track_artists
    @tracks = "\n"
    @duration = []
    @duration_final = @duration.inject(:+)
  end

  def duration
  @duration_final
  end

  def id
    @album_id
  end

  def title
    @album_title
  end

  def artists
    @track_artists
  end

  def tracks_all
    @tracks
  end

  def duration_min
    duration_min = @duration.to_i/60000
  end

  def summary
    "Name: #{title}\n"\
    "Artist(s): #{artists}\n"\
    "duration(min): #{duration} min\n"\
    "Tracks:#{tracks_all}"
  end
end

# class TrackVal
#   def initialize(album_id, track_id, title, track_number, duration_ms)
#     @album_id = album_id
#     @id = track_id
#     @title = title
#     @track_number = track_number
#     @duration_ms = []
#   end
#
#   def album_id
#     @album_id
#   end
#
#   def id
#     @id
#   end
#
#   def title
#     @title
#   end
#
#   def track_number
#     @track_number
#   end
#
#   def duration_ms
#     @duration_ms
#   end
#
#   def duration_min
#     duration_min = @duration.to_i/60000
#   end
# end

albums = []
duration_array = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  # track_2 = TrackVal.new(track[:album_id], track[:track_id], track[:title], track[:track_number], track[:duration_ms])
  album = albums.find {|a| a.id == track[:album_id] }
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end
  album.tracks_all << "#{track[:title]}\n"
  album.duration << track[:duration_ms].to_i
end

albums.each do |album|
  puts album.summary
end
