$LOAD_PATH << File.dirname(__FILE__)

require 'config'
require 'twitter_archiver'
puts TAGS
TAGS.each do |tag|
  archive = TwitterArchiver.new(tag)
  archive.update
end
