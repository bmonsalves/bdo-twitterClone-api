# encoding: UTF-8
require 'digest/md5'
set :bind, '192.168.1.34'

get '/api/users' do
  format_response(User.all, request.accept)
end

get '/api/users/:id' do
  user ||= User.get(params[:id]) || halt(404)
  format_response(user, request.accept)
end

post '/api/users' do
  body = JSON.parse request.body.read
  user = User.create(
    user:     body['user'],
    password: body['password'],
  )
  generateToken = Digest::MD5.hexdigest(body['password'])
  token = {:token => generateToken}
  puts token

  status 201
  format_response(token, request.accept)
end

put '/api/users/:id' do
  body = JSON.parse request.body.read
  user ||= User.get(params[:id]) || halt(404)
  halt 500 unless user.update(
    user:     body['user'],
    password: body['password'],
  )
  format_response(user, request.accept)
end

delete '/api/users/:id' do
  user ||= User.get(params[:id]) || halt(404)
  halt 500 unless user.destroy
end
