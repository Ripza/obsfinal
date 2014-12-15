#encoding: utf-8
class WelcomeController < ApplicationController
#encoding: utf-8
   def quita_acentos( texto)
    texto= texto.gsub('á', 'a')
    texto= texto.gsub('é', 'e')
    texto= texto.gsub('í', 'i')
    texto= texto.gsub('ó', 'o')
    texto= texto.gsub('ú', 'u')
    end
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
	topicas= ["Chile,Chile"]
	topics=["#movilh","Movilh","#FuerzaTrans","#nicolastienedospapas","nicolastienedospapas","#fuerzatrans","#Homoparentalidad","igualesChile","#leyIdentidadEsVital","#NoMasTalVez","movilh","GayParade","AVP","avp","noalavp","#AVP","AVPahora","noalAVP","NOLAVP","GayParade2014","MatrimonioIgualitario","MUMS_Chile","#NicolasTieneDosPapás", "DejaSalirTusDerechos"]
	
	palabras=Busqueda.all
	busqueda=[]
	intnsn=[]
	palabras.each do |x|
	
		if(x.intension == "negativo" or x.intension == "positivo")
			busqueda.push x.palabra
			intnsn.push x.intension
		#	print "primera vuelta"
		#	print x.palabra
		#	print x.intension
		#	print "\n"
		else
		end
	end
	palabras.each do |x|
	
	#	if(x.intension == "positivo" or x.intension == "negativo")
	#	else
	#	#	busqueda.push x.palabra
		#	intnsn.push x.intension
		#	print "segunda vuelta"
		#	print x.palabra
		#	print x.intension
		#	print "\n"
	#	end
	end
	contador = 0
	contador2 = 0
	@comuna = Comuna.all
	@tweets = []	
	client.filter(:track => busqueda.join(",")) do |twitter|
	
	#busqueda.each do |m|

	#sClient.search(m, :result_type => "recent").take(30).collect do |twitter|

	   if twitter.user.lang != "es"
		  next
	   end
		contador += 1
		if	twitter !=nil and  contador < 100
		 
			puts contador
			print "##############################################\n"
			print "#####	 	Tweet		       ######\n"
			print "##############################################\n"
			print "BUSQUEDA : -----------> #{m}\n"
			print "USUARIO LOCATION : -----------> #{twitter.user.location}\n"
			sleep(1)
			#print "Tweet creado en : -----------> #{twitter.created_at}\n"
			#print "Id tweet -------------> #{twitter.id}\n"
			#print "Mensaje :---> #{twitter.text}\n"	
			
			
			#print "Es favorito  : --------->#{twitter.favorited?}\n"
			#print "Truncado : ----------> #{twitter.truncated?}\n"
			#print "Contador retweet:---------> #{twitter.retweet_count}\n"
			#print "Contador Favoritos: ----------> #{twitter.favorite_count}\n"	
			#print "Retweetiado : --------->#{twitter.retweeted?}\n"
			#print "Lenguaje del tweet ----------->  #{twitter.lang}\n"
			
			aux_source = twitter.source
			if(aux_source.include?("download"))
			
				if(aux_source.include?("Android"))
					source = "Android"
				
				elsif(aux_source.include?("iPhone"))
					source = "iPhone"
				
				elsif(aux_source.include?("iPad"))
					source = "iPad"
					
				elsif(aux_source.include?("BlackBerry®"))
					source = "BlackBerry"
				
				elsif(aux_source.include?("Android Tablets"))
					source = "Android Tablets"
					
				elsif(aux_source.include?("Windows Phone"))
					source = "Windows Phone"
				
				end
			
			elsif(aux_source.include?("Web Client"))
					source = "Web Client"
				
			elsif(aux_source.include?("Mobile"))
					source = "Mobile"
					
			elsif(aux_source.include?("Windows Phone"))
				source = "Windows Phone"
				
			elsif(aux_source.include?("BlackBerry®"))
				source = "BlackBerry"
			
			elsif(aux_source.include?("nofollow"))
					source = aux_source[(aux_source.index(">")+1)..(aux_source.rindex("<"))-1]
			end


			@tweet = Tweet.create({

				#TWEET

				:mensaje_id =>twitter.id,
				:texto =>twitter.text ,
				:creacion_tweet =>twitter.created_at,
				:recurso =>source

			});
			cnt = 0 
		#	cntp = 0 
		#	cntn = 0 
		#	cntne = 0 
		#	palp = nil
		#	paln = nil
		#	palne = nil
			busqueda.each do |x|
					aux=quita_acentos(twitter.text.downcase)
				#	puts aux+"\n"
				#	puts x.downcase
				#	puts aux.include?x.downcase
				#			sleep 0.5
					if(intnsn[cnt] == "negativo" or intnsn[cnt] == "positivo")
						if(aux.include?x.downcase)
							pal=Busqueda.find_by_palabra(x)
							pal.tweets << @tweet
				#			cntp += 1 
						else
						end
				#	elsif(intnsn[cnt] == "negativo" and paln.nil? == true)
				#		if(aux.include?x.downcase)
				#			print intnsn[cnt]
				#			print "\n"
				#			paln=Busqueda.find_by_palabra(x)
				#			cntn += 1 
				#			sleep 1.5
				#		else
				#		end
				#	elsif(aux.include?x.downcase and palne.nil? == true)
				#			palne=Busqueda.find_by_palabra(x)
				#			cntne += 1
					else						
						if(aux.include?x.downcase)
							pal=Busqueda.find_by_palabra(x)
							pal.tweets << @tweet
						else
						end
					end
					cnt += 1
			end
			
			#print cntp
			#print "\n"
			#print cntn
			#print "\n"
			#print cntne
			#print "\n"
			#if(cntn > 0)
			#	sleep 1.5
			#else
			#end
			#if(cntp > cntn)
			#	palp.tweets << @tweet
			#elsif(cntn > cntp)
			#	paln.tweets << @tweet
			#elsif(cntp = cntn and cntne > 0)
			#	palne.tweets << @tweet
			#else
			#end
			
			
			aux_tweet = Tweet.find_by_mensaje_id(twitter.id.to_s)
			@hash =[]
			twitter.hashtags.each do |hastag|
				print "Hashtag : ----------> #{hastag.text}\n"
				if Hashtag.exists?(:tag => quita_acentos(hastag.text.downcase))== true
					@hashtag = Hashtag.find_by_tag(quita_acentos(hastag.text.downcase))
				else
					@hashtag = Hashtag.create({
					#HASHTAG
					:tag =>quita_acentos(hastag.text.downcase),
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

				aux_location = twitter.user.location
				if(aux_location.nil? == false)
					@comuna.each do |x| 
						nombre = quita_acentos(x.comuna_nombre.downcase)
						aux_location = quita_acentos(aux_location.downcase)
						if(aux_location.include?nombre)
							aux_comuna = Comuna.find_by_comuna_nombre(x.comuna_nombre)
							aux_comuna.usuarios << aux_usuario
							break
						end
					end
				end
				if twitter.geo.nil? == false
					
					aux_location = twitter.geo.coordinates
					@localizacion = Localizacion.create({

						#Localizacion

						:latitud =>aux_location[0],
						:longitud =>aux_location[1] ,
						:lugar =>twitter.place.full_name

					});
					@localizacion.tweets << @tweet
				else
				
				end
				
			print "Geolocalizacion tweet: -------> #{twitter.geo.coordinates}\n"
			print "Lugar del tweet:    --------> #{twitter.place.full_name}\n"
		else
			redirect_to tweets_path  and return
			break;
		end #twitter
	#	end #REST
     end #client
  end #index
end #class
