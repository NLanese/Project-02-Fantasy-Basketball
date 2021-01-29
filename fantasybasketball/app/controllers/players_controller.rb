require './config/environment'

class PlayersController < ApplicationController

    get '/players/all' do
        @players = Player.all
        erb :'players/all'
    end
    
    get '/players/:slug' do
        @player = Player.find_by_slug(params[:slug])
        erb :'players/show'
    end
end