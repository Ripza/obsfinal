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
	topicas= ["Chile","chile"]
	topics=["#movilh","Movilh","#FuerzaTrans","#nicolastienedospapas","nicolastienedospapas","#fuerzatrans","#Homoparentalidad","igualesChile","#leyIdentidadEsVital","#NoMasTalVez","movilh","GayParade","AVP","avp","noalavp","#AVP","AVPahora","noalAVP","NOLAVP","GayParade2014","MatrimonioIgualitario","MUMS_Chile","#NicolasTieneDosPapás"];
	
	palabras=PalabraBuscar.all
	busqueda=[]
	palabras.each do |x|
	busqueda.push x.palabra
	end
contador = 0
	@tweets = []	
	client.filter(:track => busqueda.join(",")) do |twitter|
	contador += 1
	if	twitter !=nil and  contador < 5
	 
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
	@hash =[]
	twitter.hashtags.each do |hastag|
	print "Hashtag : ----------> #{hastag.text}\n"
	@hash.push hastag.text
	end	

	print "Geolocalizacion tweet: -------> #{twitter.geo.coordinates}\n"
	print "Lugar del tweet:    --------> #{twitter.place.full_name}\n"
	
	print "##############################################\n"
	print "#####	 	Usuario		       ######\n"
	print "##############################################\n"
	print "\nNombre usuario : ------------> #{twitter.user.name}\n "
	print "Nombre cuenta (Nick): --------> #{twitter.user.screen_name}\n"	
	print "usuario creado en: ------------> #{twitter.user.created_at}\n"
	print "Localizacion usuario: --------> #{twitter.user.location}\n "
	print "Id del usuario: -------------> #{twitter.user.id}\n"
	
	print "Contador de Seguidores :-------> #{twitter.user.followers_count}\n"
	print "Lenguaje de usuario: ----------->  #{twitter.user.lang}\n"
	print "Cuenta verificada: ----------> #{twitter.user.verified?}\n "
	print "Geoloaclizacion habilitada: ---------> #{twitter.user.geo_enabled?}\n "
	print "Zona Horaria:  ------------> #{twitter.user.time_zone}\n"
	print "Descripcion del Usuario: ------------> #{twitter.user.description}\n"
	print "Recursos (Dispositivo): --------------> #{twitter.source}\n"	
	
	print "Contador retweet :-------------> #{twitter.retweet_count}\n"
	print "***************************************************************************\n\n"
	if twitter.geo == nil 
	@coordenadas=""
	else
	@coordenadas=twitter.geo.coordinates.to_s
	end
 	@tweet = Tweet.create({

			#TWEET

			:id =>twitter.id,
			:tweet_texto =>twitter.text ,
			:creacion_tweet =>twitter.created_at,
			:recurso =>twitter.source

			});	
=begin
	@usuario=Usuario.new({

			#USUARIO

  			attr_accessible :contador_seguidores, :creacion_usuario, :cuenta_verificada, :descripcion, :id, :lenguaje_usuario, :nick, :nombre
  			has_many : tweet

			:id => twitter.user.id,
			:nombre => twitter.user.name ,  
			:nick  => twitter.user.screen_name ,
			:descripcion =>twitter.user.description,
			:creacion_usuario => twitter.user.created_at,
			:lenguaje_usuario=>twitter.user.lang		,		
			:cuenta_verificada =>twitter.user.verified?,
			:contador_seguidores =>twitter.user.followers_count,
			});	



	@localizacion=Localizacion.new({

			#LOCALIZACION	

 			 attr_accessible :ciudad, :comuna, :localizacion_id, :pais, :region
  			has_and_belongs_to_many :tweet

			if twitter.place.full_name != nil
				:lugar_tweet => twitter.place.full_name,
			else
			:geo_enable_usuario =>twitter.user.geo_enabled?,
			:geolocalizacion_tweet =>@coordenadas,
			end


			});	
	@hashtag=Hashtag.new({
			#HASHTAGS
			:hashtags => @hash.join(" ")	 ,
			});			
			end
=end
				
			#@tweet.save();

	
	end
		redirect_to tweet_path(@tweet) and return
		break;
     end
  end
end
