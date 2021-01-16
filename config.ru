require 'active_record'
require './config/environment'

use Rack::MethodOverride
run ApplicationController