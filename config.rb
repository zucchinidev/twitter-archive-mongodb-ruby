require 'dotenv'
Dotenv.load('twitter.env')

DATABASE_HOST   = 'localhost'
DATABASE_PORT   = 27017
DATABASE_NAME   = "twitter-archive"
COLLECTION_NAME = "tweets"
TAGS = ["#MongoDB", "#Mongo"]

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']
ACCESS_TOKEN = ENV['ACCESS_TOKEN']
ACCESS_TOKEN_SECRET = ENV['ACCESS_TOKEN_SECRET']
