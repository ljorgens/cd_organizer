require ("sinatra")
require ("sinatra/reloader")
also_reload("./lib/**/*.rb")
require ("./lib/cd_organizer.rb")

get('/') do
  @albums = Disc.list_all()
  erb(:index)
end

post('/album') do
  @name = params.fetch("title")
  @artist = params.fetch("artist")
  album = Disc.new({:name => @name, :artist => @artist})
  album.create()
  @albums = Disc.list_all()
  erb(:index)
end
