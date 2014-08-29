#!/usr/bin/ruby
 
require 'rubygems'
require 'oauth'

consumer_key='musichackday2014'
consumer_secret='276ea410-29fb-11e4-8c21-0800200c9a66'
site = 'https://ipool.s.asideas.de'

@consumer=OAuth::Consumer.new consumer_key,
                              consumer_secret,
                              {:site => site}
@access_token = OAuth::AccessToken.new(@consumer)
puts @access_token.get('/api/v3/search').body