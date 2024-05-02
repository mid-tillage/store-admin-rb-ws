require 'sinatra'
require 'httparty'
require 'json'
require_relative '../repositories/product_on_sale_repository'

STORE_ENGINE_ORCHESTRATOR_ENDPOINT = ENV['STORE_ENGINE_ORCHESTRATOR_PROTOCOL'] + '://' + ENV['STORE_ENGINE_ORCHESTRATOR_IP'] + ':' + ENV['STORE_ENGINE_ORCHESTRATOR_PORT']

get '/product-on-sale/:id' do
  content_type :json
  product_on_sale = ProductOnSaleRepository.get_product_on_sale_by_id(params[:id])
  JSON.pretty_generate(product_on_sale)
end

post '/product-on-sale' do
  content_type :json
  body = JSON.parse(request.body.read)
  response = HTTParty.post("#{STORE_ENGINE_ORCHESTRATOR_ENDPOINT}/product", body: body.to_json, headers: {'Content-Type' => 'application/json'})
  response.body
end

put '/product-on-sale/:id' do
  content_type :json
  body = JSON.parse(request.body.read)
  response = HTTParty.put("#{STORE_ENGINE_ORCHESTRATOR_ENDPOINT}/product/#{params[:id]}", body: body.to_json, headers: {'Content-Type' => 'application/json'})
  response.body
end

delete '/product-on-sale/:id' do
  content_type :json
  response = HTTParty.delete("#{STORE_ENGINE_ORCHESTRATOR_ENDPOINT}/product/#{params[:id]}", headers: {'Content-Type' => 'application/json'})
  response.body
end