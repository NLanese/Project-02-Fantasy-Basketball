require './config/environment'

class PlayersController < ApplicationController

    get '/players/all' do # GOOD #
        @players = Player.all.sort_by{ |player| player.ppg}
        @session = session
        erb :'players/all'
    end
    
    get '/players/:slug' do # GOOD #
        @player = Player.find_by_slug(params[:slug])
        erb :'players/show'
    end

    post "/players/draft/:slug" do # GOOD #
        @player = Player.find_by_slug(params[:slug])
        @user = Helpers.current_user(session)
        @player.user = @user
        @player.save
        redirect to "/users/show/#{@user.slug}"
    end

    post "/players/drop/:slug" do 
        @player = Player.find_by_slug(params[:slug])
        @player.user = nil
        @player.save
        @user = Helpers.current_user(session)
        redirect to "/users/show/#{@user.slug}"
    end

end