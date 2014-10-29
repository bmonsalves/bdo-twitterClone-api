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

post '/api/users/register' do
  
  body = JSON.parse request.body.read
  generateToken = Digest::MD5.hexdigest(body['password'])
  count = User.count(:conditions => [ 'user = ?', body['user'] ])
  if count == 0
    user = User.create(
      name:       body['name'],
      email:      body['email'],
      user:       body['user'],
      password:   body['password'],
      token:      generateToken,
    )
    
    token = {
      :codigo => "201",
      :token => generateToken
    }

    status 201
    format_response(token, request.accept)

  else
    data = {
      :codigo => "422",
      :mensaje => "Usuario ya existe"
    }

    format_response(data, request.accept)
    
  end
  
end

post '/api/users/login' do
  body = JSON.parse request.body.read
  user = repository(:default).adapter.select('SELECT token FROM users WHERE user = ? AND password = ?', body['user'] ,body['password'])
  if user.first != nil
    token = {
      :codigo => "200",
      :token => user.first
    }
    format_response(token, request.accept)

  else
    data = {
      :codigo => "422",
      :mensaje => "Error de credenciales"
    }
    format_response(data, request.accept)

  end
  
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
