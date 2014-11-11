class ApplicationController < ActionController::Base

  def index
  	require 'twitter'
	client = Twitter::Streaming::Client.new do |config|
  		config.consumer_key        = "Y5a8QzsrpZYpI3f27OIQcEngv"
  		config.consumer_secret     = "m718AMKm6rAbZDv3oT6yd4SXJSmugSiZtc4PF8NlF4NcmYo4KH"
  		config.access_token        = "2834690081-bEV4kMzTVE349jsZJZCIRuJn2BwYF9071Y05fBm"
  		config.access_token_secret = "fSn2XUXFJDXuh5qr3W3bXoHZik5O6w4ekcnC1fzdV2HZO"
	end
	topics = ["Pink Floyd", "The Beatles"]
	contador = 0
	@tweets = []	
	client.filter(:track => topics.join(",")) do |object|
		contador += 1
		if contador > 10
			break
  		else
  			puts object.text if object.is_a?(Twitter::Tweet)
  			puts contador 
  			@tweets.push object.text if object.is_a?(Twitter::Tweet)
  			#@tweets = object.text if object.is_a?(Twitter::Tweet)
  		end
  	end
  end
end
