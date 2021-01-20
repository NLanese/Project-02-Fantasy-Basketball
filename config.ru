require 'active_record'
require 'sqlite3'
require './config/environment'

use Rack::MethodOverride
run ApplicationController