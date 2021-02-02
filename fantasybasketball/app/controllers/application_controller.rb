require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do # GOOD #
    erb :index
  end

  get "/logout" do # GOOD #
    session.clear 
    redirect to "/"
  end
  

end
