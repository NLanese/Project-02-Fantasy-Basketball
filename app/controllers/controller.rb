require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get '/' do    # GOOD #
    erb :index
  end

  get '/users/login' do  # GOOD #
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @session = session
      redirect to "users/show/#{@user.slug}"
    else
      session[:success] = true
      @session = session
      erb :'users/login'
    end
  end

  get '/users/signup' do # GOOD #
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @session = session
      redirect to "users/show/#{@user.slug}"
    else
      session[:success] = true
      @session = session
      erb :'users/signup'
    end
  end

  post '/users/login' do
    if (User.find_by_name(params[:name]))
      @user = User.find_by_name(params[:name])
      if (@user.password.authenticate)
        session[:user_id] = @user.id 
        redirect to "/users/show/#{@user.slug}"
      else
        session[success] = "false"
        @session = session
        erb :'users/login'
      end
    else
      session[success] = "false"
      @session = session
      erb :'users/login'
    end
  end

  post '/users/signup' do
    if (params[:name] == "" || params[:password] == "" || params[:email] == "")
      session[success] = false
      @session = session
      erb :'users/signup'
    else
      session[success] = true
      @user = User.create(name: params[:name], password: params[:password], email: params[:email])
      session[:user_id] = true
      @session = session
      redirect to "users/show/#{@user.slug}"
  end


end

