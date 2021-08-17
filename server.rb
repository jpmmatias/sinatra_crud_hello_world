require 'sinatra'
require './models/model'

spot = Dog.new('Spot', 4)
fluffy = Dog.new('Fluffy', 3)

dogs = [spot, fluffy]

set :public_folder, "#{File.dirname(__FILE__)}/static"

get '/' do
  erb :index
end

post '/' do
  content_type :json
  return request.body.read.to_json
end

get '/dog' do
  content_type :json
  dogs.to_json
end

post '/dog' do
  content_type :json
  body = JSON.parse request.body.read
  dogs.push(Dog.new(body['name'], body['age']))
  dogs.to_json
end

put '/dog/:index' do
  content_type :json
  index = params['index'].to_i
  body = JSON.parse request.body.read
  dogs[index] = Dog.new(body['name'], body['age'])
  dogs.to_json
end

delete '/dog/:index' do
  content_type :json
  index = params['index'].to_i
  dogs.delete_at(index)
  dogs.to_json
end
