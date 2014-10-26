# encoding: UTF-8
class User
  include DataMapper::Resource

  property :id,         Serial
  property :user,       String
  property :password,   String
end
