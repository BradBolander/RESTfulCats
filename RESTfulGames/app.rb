require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulgames'
)

get '/' do
  @game = Game.new
  @game.name = 'Final Fantasy 7'
  @game.studio = 'Square Enix'
  @game.releaseyear = '1997'
  @game.genre = 'RPG'
  @game.save
  @game.to_json
end


get '/api/games' do

  Game.all.to_json

end

get '/api/games/:id' do
  puts params
  Game.find(params[:id]).to_json
end

post '/api/games' do
puts params
Game.create({
  :name => params[:name],
  :studio => params[:studio],
  :releaseyear => params[:releaseyear],
  :genre => params[:genre]
}).to_json
end

patch '/api/games/:id' do
  game_args = { :name => params[:name], :studio => params[:studio], :releaseyear => params[:releaseyear], :genre => params[:genre]}
  @game = Game.find(params[:id])
  @game.update(game_args)
  @game.to_json
end

delete '/api/games/:id' do
  Game.destroy(params[:id]).to_json
end
