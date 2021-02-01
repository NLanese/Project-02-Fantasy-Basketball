require './config/environment'

class UsersController < ApplicationController


    get '/users/login' do  # GOOD #
        if Helpers.is_logged_in?(session) # GOOD #
          @user = User.find(session[:user_id]) # GOOD #
          @session = session # GOOD #
          redirect to "/users/show/#{@user.slug}" # GOOD #
        else
          session[:success] = true # GOOD #
          @session = session # GOOD #
          erb :'users/login' # GOOD #
        end
    end
    
    get '/users/signup' do # GOOD #
        if Helpers.is_logged_in?(session) # GOOD #
          @user = User.find(session[:user_id]) # GOOD #
          @session = session # GOOD #
          redirect to "/users/show/#{@user.slug}" # GOOD #
        else
          session[:success] = true # GOOD #
          @session = session  # GOOD #
          erb :'users/signup' # GOOD #
        end
    end

    get '/users/all' do
      @users = User.all
      erb :'users/all'
    end
    
    post '/users/login' do # GOOD #
        if (User.find_by_name(params[:name])) # GOOD #
          @user = User.find_by_name(params[:name]) # GOOD #
          if (@user.authenticate(params[:password])) # GOOD #
            session[:user_id] = @user.id  # GOOD #
            redirect to "/users/show/#{@user.slug}" # GOOD #
          else
            session[:success] = "false" # GOOD #
            @session = session # GOOD #
            erb :'users/login' # GOOD #
          end
        else
          session[:success] = "false" # GOOD #
          @session = session # GOOD #
          erb :'users/login' # GOOD #
        end
    end
    
    post '/users/signup' do # GOOD #
        if (params[:name] == "" || params[:password] == "" || params[:email] == "") # GOOD #
          session[:success] = false # GOOD #
          @session = session # GOOD #
          erb :'users/signup' # GOOD #
        else
          session[:success] = true # GOOD #
          @user = User.create(name: params[:name], password: params[:password], email: params[:email]) # GOOD #
          session[:user_id] = @user.id # GOOD #
          @session = session # GOOD #
          redirect to "/users/show/#{@user.slug}" # GOOD #
        end
    end
    
    get '/users/show/:slug' do # GOOD #
        @user = User.find_by_slug(params[:slug]) # GOOD #
        @session = session # GOOD #
        erb :'users/show' # GOOD #
    end
    
    post '/users/trade-between/:slug1/:slug2' do
        @user1 = User.find_by_slug(params[:slug1])
        @user2 = User.find_by_slug(params[:slug2])
        erb :'users/trade'
    end
    
    post '/users/submit-trade' do
            
    end
    
    get '/users/:slug/trade-requests' do
        if Helpers.is_logged_in?(session)
          @user = User.find_by_slug(params[:slug])
          erb :'users/trade-request'
        else
          redirect to '/users/login'
        end
    end

end