#encoding: utf-8
class WelcomeController < ApplicationController
#encoding: utf-8
  def index
  	require 'twitter'
	@limite=0;
	config = {
           	consumer_key: 'Y5a8QzsrpZYpI3f27OIQcEngv',
  	   	consumer_secret: 'm718AMKm6rAbZDv3oT6yd4SXJSmugSiZtc4PF8NlF4NcmYo4KH',
  		access_token: '2834690081-bEV4kMzTVE349jsZJZCIRuJn2BwYF9071Y05fBm',	
  		access_token_secret: 'fSn2XUXFJDXuh5qr3W3bXoHZik5O6w4ekcnC1fzdV2HZO'
        }


	sClient = Twitter::REST::Client.new config 
	client = Twitter::Streaming::Client.new(config)
	topicas= ["USA","twitter"]
	topics=["#movilh","Movilh","#FuerzaTrans","#nicolastienedospapas","nicolastienedospapas","#fuerzatrans","#Homoparentalidad","igualesChile","#leyIdentidadEsVital","#NoMasTalVez","movilh","GayParade","AVP","avp","noalavp","#AVP","AVPahora","noalAVP","NOLAVP","GayParade2014","MatrimonioIgualitario","MUMS_Chile","#NicolasTieneDosPapás"];
	
	#palabras=PalabraBuscar.all
	#busqueda=[]
	#palabras.each do |x|
	#busqueda.push x.palabra
	#end
	contador = 0
	@tweets = []	
	#client.filter(:track => busqueda.join(",")) do |twitter|
	client.filter(:track => topicas.join(",")) do |twitter|

	contador += 1
	if	twitter !=nil and  contador < 30
	 
		puts contador
		print "##############################################\n"
		print "#####	 	Tweet		       ######\n"
		print "##############################################\n"
		print "Es favorito  : --------->#{twitter.favorited?}\n"
	      	print "Truncado : ----------> #{twitter.truncated?}\n"
		print "Tweet creado en : -----------> #{twitter.created_at}\n"
		print "Id tweet -------------> #{twitter.id}\n"
		print "Mensaje :---> #{twitter.text}\n"	
		print "Contador retweet:---------> #{twitter.retweet_count}\n"
		print "Contador Favoritos: ----------> #{twitter.favorite_count}\n"	
		print "Retweetiado : --------->#{twitter.retweeted?}\n"
		print "Lenguaje del tweet ----------->  #{twitter.lang}\n"

 		@tweet = Tweet.create({

			#TWEET

			:mensaje_id =>twitter.id,
			:texto =>twitter.text ,
			:creacion_tweet =>twitter.created_at,
			:recurso =>twitter.source

		});	
		aux_tweet = Tweet.find_by_mensaje_id(twitter.id.to_s)
		@hash =[]
		twitter.hashtags.each do |hastag|
			print "Hashtag : ----------> #{hastag.text}\n"
			if Hashtag.exists?(:tag => hastag.text)== true
				@hashtag = Hashtag.find_by_tag(hastag.text)
			else
				@hashtag = Hashtag.create({
				#HASHTAG
				:tag =>hastag.text,
				});	
			end
			aux_tweet.hashtags << @hashtag
		end
		if Usuario.exists?(:cuenta_id => twitter.user.id.to_s)== true

			aux_usuario=Usuario.find_by_cuenta_id(twitter.user.id.to_s)
			aux_usuario.tweets << @tweet
			
		else
			if twitter.user.name.nil?
				aux_name = " "
			else
				aux_name = twitter.user.name
			end
			if twitter.user.description.nil?
				aux_description = " "
			else
				aux_description = twitter.user.description
			end

			@usuario = Usuario.new({
				#USUARIO
				:cuenta_id => twitter.user.id.to_s,
				:nombre => aux_name ,  
				:nick  => twitter.user.screen_name ,
				:descripcion => aux_description,
				:creacion_usuario => twitter.user.created_at,
				#:lenguaje_usuario=>twitter.user.lang,		
				#:cuenta_verificada =>twitter.user.verified?,
				:contador_seguidores =>twitter.user.followers_count
			});
			@usuario.save();
			aux_usuario = Usuario.find_by_cuenta_id(twitter.user.id.to_s)
			aux_usuario.tweets << @tweet
		end

		print "Geolocalizacion tweet: -------> #{twitter.geo.coordinates}\n"
		print "Lugar del tweet:    --------> #{twitter.place.full_name}\n"
	
			if twitter.geo == nil 
				@coordenadas=""
			else
				@coordenadas=twitter.geo.coordinates.to_s
			end
	else
		redirect_to tweets_path  and return
		break;
	end
     end
  end
end
