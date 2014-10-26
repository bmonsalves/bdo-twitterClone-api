# encoding: UTF-8
require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

configure :development do
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
    :default,
    'mysql://root:root@localhost/twitter_clone'
  )
end

configure :production do
  DataMapper.setup(
    :default,
    'postgres://postgres:12345@localhost/twitter_clone'
  )
end

require './models/init'
require './helpers/init'
require './routes/init'

DataMapper.finalize
