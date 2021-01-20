ENV['SINATRA_ENV'] ||= "development"
require 'active_record'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/database.sqlite"
)

require_all 'app'