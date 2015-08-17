require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulsongs'
)

get '/' do
  @song = Song.new
  @song.name = 'Little Secrets'
  @song.artist = 'Passion Pit'
  @song.save
  @song.to_json
end


get '/api/songs' do

  Song.all.to_json

end

get'/api/songs/:id' do
  puts params

  Song.find(params[:id]).to_json
end

post '/api/songs' do
puts params
Song.create({
  :name => params[:name],
  :artist => params[:artist]
}).to_json
end

patch '/api/songs/:id' do
  song_args = { :name => params[:name], :artist => params[:artist] }
  @song = Song.find(params[:id])
  @song.update(song_args)
  @song.to_json
end

delete '/api/songs/:id' do
  Song.destroy(params[:id]).to_json
end
