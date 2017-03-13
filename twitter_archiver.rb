$LOAD_PATH << File.dirname(__FILE__)
require 'rubygems'
require 'mongo'
require 'twitter'
require 'config'



class TwitterArchiver
  def initialize(tag)
    client = Mongo::Client.new(
      [
        "#{DATABASE_HOST}:#{DATABASE_PORT}"
      ], :database => "#{DATABASE_NAME}"
    )
    @tweets = client["#{COLLECTION_NAME}"]
    # if @tweets.indexes
    #   @tweets.indexes.drop_all
    # end
    # TAG ASCENDING, ID DESCENDING
    @tweets.indexes.create_many([
      { :key => { tags: 1} },
      { :key => { id: -1} }
      ])
    @tag = tag
    @tweets_found = 0

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "#{API_KEY}"
      config.consumer_secret = "#{API_SECRET}"
      config.access_token = "#{ACCESS_TOKEN}"
      config.access_token_secret = "#{ACCESS_TOKEN_SECRET}"
    end
  end

  def update
    puts "Starting Twitter search for #{@tag}"
    save_tweet_for(@tag)
    print "Tweets founds #{@tweets_found}, tweets saved \n\n"
  end
  private

  def save_tweet_for(term)
    @client.search(term).each do |tweet|
      @tweets_found += 1
      tweet_doc = tweet.to_h
      tweet_tag = term
      tweet_doc[:_id] = tweet_doc[:id]
      @tweets.insert_one(tweet_doc)
      break if @tweets_found == 500
    end
  end
end
