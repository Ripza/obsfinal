class WelcomeController < ApplicationController

  def index
  	require 'twitter'
	client = Twitter::Streaming::Client.new do |config|
  		config.consumer_key        = "Y5a8QzsrpZYpI3f27OIQcEngv"
  		config.consumer_secret     = "m718AMKm6rAbZDv3oT6yd4SXJSmugSiZtc4PF8NlF4NcmYo4KH"
  		config.access_token        = "2834690081-bEV4kMzTVE349jsZJZCIRuJn2BwYF9071Y05fBm"
  		config.access_token_secret = "fSn2XUXFJDXuh5qr3W3bXoHZik5O6w4ekcnC1fzdV2HZO"
	end
	topics = ["-122.75,36.8,-121.75,37.8", "-74,40,-73,41"]
	topics2 = ["chile","teleton"]
	contador = 0
	@tweets = []	
	client.filter(:track => topics2.join(",")) do |object|
		contador += 1
		if contador > 20
			break
  		else
  			puts object.text if object.is_a?(Twitter::Tweet)
			print "\n***********[#{object.user.screen_name}]***********\n"
			print "\n Nombre cuenta (Nick):#{object.user.screen_name}\n"
			print "Mensaje :---> #{object.text}\n"
			print "Favorito (boolean) ----> #{object.favorited} \n "
			print  "Localizacion usuario :--> *** #{object.user.location} *** \n "
			print  " identificador :---> ***#{object.id} ---> \n "
			print  " Nombre usuario :---> ***#{object.user.name} ---> \n "
			print  " Cuenta verificada :---> ***#{object.user.verified} ---> \n "
			print  " geo enable :---> ***#{object.user.geo_enabled} ---> \n "
			print  " zona horaria -----> #{object.user.time_zone}\n"
			print  " descripcion usuario ------> #{object.user.description}\n"
			print  " contador retweet  ---------> #{object.retweet_count}\n"
			print  "  hashtag  -------> #{object.hashtags}\n"
  			puts contador 
  			@tweets.push object.text if object.is_a?(Twitter::Tweet)
  			#@tweets = object.text if object.is_a?(Twitter::Tweet)
  		end
  	end
  end
end
