# encoding: UTF-8
class User
  include DataMapper::Resource

  property :id,         Serial
  property :name,		String
  property :email,		String
  property :user,       String
  property :password,   String
  property :token,	    String
  
end
