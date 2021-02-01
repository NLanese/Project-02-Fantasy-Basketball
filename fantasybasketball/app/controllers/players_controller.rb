require './config/environment'

class PlayersController < ApplicationController

    get '/players/all' do # GOOD #
        @players = Player.all
        @session = session
        erb :'players/all'
    end
    
    get '/players/:slug' do # GOOD #
        @player = Player.find_by_slug(params[:slug])
        erb :'players/show'
    end

    post "/players/draft/:slug" do 
        @player = Player.find_by_slug(params[:slug])
        @player.user = Helpers.current_user(session)
        @user = Helpers.current_user(session)
        redirect to "/users/show/#{@user.slug}"
    end

    post "/players/drop/:slug" do 
        @player = Player.find_by_slug(params[:slug])
        @player.user = nil
        @user = Helpers.current_user(session)
        redirect to "/users/show/#{@user.slug}"
    end

end