#!/usr/bin/env ruby

require 'rubygems'
require 'net/http'
require 'xmlsimple'
require 'twitter'

# set last.fm user name to get last song from

username = 'notlukemiles'

# url for last.fm last song
url = "http://ws.audioscrobbler.com/2.0/user/#{username}/recenttracks?limit=1"

# fetch XML from last fm and parse for artist and track name of last played song
xml_data = Net::HTTP.get_response(URI.parse(url)).body
data = XmlSimple.xml_in(xml_data)

artist = data['track'][0]['artist'][0]['content']
trackName = data['track'][0]['name'][0]

blurb = "#{artist} - #{trackName}"

puts "last song played: #{blurb}"

if blurb.length > 30
	# adds ellipses to long track names
	blurb = blurb[0..26] << "..."
end

# set up twitter
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

#update location field on twitter profile with blurb we generated
begin
	client.update_profile(:location => blurb)
	rescue Exception => e
	  puts e.message
end

puts "twitter successfully updated with song info. :+)"