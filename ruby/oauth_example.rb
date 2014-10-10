#!/usr/bin/ruby
 
require 'rubygems'
require 'oauth'

consumer_key='hackathon'
consumer_secret='33f3fb11-59b4-4a38-a549-27bb4628d1af'
site = 'https://ipool.s.asideas.de'

@consumer=OAuth::Consumer.new consumer_key,
                              consumer_secret,
                              {:site => site}
@access_token = OAuth::AccessToken.new(@consumer)
puts @access_token.get('/api/v3/search').body