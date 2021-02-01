require './config/environment'

class TeamsController < ApplicationController

  get '/teams/all' do # GOOD #
      @teams = Team.all
      erb :'teams/all'
  end
    
  get '/teams/:slug' do # GOOD #
     @team = Team.find_by_slug(params[:slug])
     erb :'teams/show'
  end


end
