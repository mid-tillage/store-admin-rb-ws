require 'sinatra'
require 'httparty'
require 'dotenv/load'

require_relative 'app/config/database'
require_relative 'app/models/product_on_sale'
require_relative 'app/controllers/product_on_sale_controller'

set :port, ENV['SERVER_PORT'].to_i
