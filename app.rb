require ("sinatra")
require ("sinatra/reloader")
also_reload("./lib/**/*.rb")
require ("./lib/cd_organizer")

get('/') do
  
  erb(:index)
end
