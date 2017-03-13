$LOAD_PATH << File.dirname(__FILE__)
require 'rubygems'
require 'mongo'
require 'sinatra'                 
require 'config'
require 'open-uri'

configure do
  client = Mongo::Client.new(["#{DATABASE_HOST}:#{DATABASE_PORT}"], :database  => "#{DATABASE_NAME}")
  TWEETS = client["#{COLLECTION_NAME}"]
end

get '/' do
  selector = {}
  if params['tag']
    selector = { :tags => params['tag'] }
  end
  sort = { "$sort" => { 'id' => -1 } }
  @tweets = TWEETS.find(selector, sort).limit(10)
  erb :tweets
end